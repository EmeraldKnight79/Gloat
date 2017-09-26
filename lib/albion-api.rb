require 'httparty'

BASE_API_URL = "https://gameinfo.albiononline.com/api/gameinfo".freeze

# this module contains all of the classes needed to make requests to the Albion Online API
module AlbionApi
  # this class can make the calls to the UserKillboard APIs
  class UserKillboard
    include HTTParty
    base_uri BASE_API_URL

    def initialize(character_api_id)
      @character_api_id = character_api_id
    end

    def top_kills(page = 0)
      offset = page * 51
      self.class.get("/players/#{@character_api_id}/topkills?range=month&limit=51&offset=#{offset}")
    end

    def top_kills_in_range(start_time, end_time)
      # get the difference between the end and start time
      # determine how long ago it was from now, likely 1 day max
      # make the top kills request with teh proper `range` param
      # filter the raw response down to only those kills within the timestamp range
      # return a response class
      raw_kills = []
      page = 0
      resp = top_kills
      until resp.empty? do
        raw_kills.concat JSON.parse(resp.body)
        page += 1
        resp = top_kills(page)
      end
      filtered_kills = raw_kills.select do |kill|
        Time.parse(kill['TimeStamp']).between?(start_time, end_time) && kill['GvGMatch'].nil?
      end.flatten
      UserKillboardResponse.new(filtered_kills)
    end

    private

    attr_accessor :character_api_id
  end

  # class that contains the relevant information about a killboard API response
  class UserKillboardResponse
    def initialize(response)
      @_group_members = extract_group_members(response)
      @_items_dropped = extract_dropped_items(response)
      @_players_killed = extract_players_killed(response)
    end

    def group_members
      _group_members
    end

    def items_dropped
      _items_dropped
    end

    def players_killed
      _players_killed
    end

    private

    attr_accessor :_group_members, :_items_dropped, :_players_killed

    def extract_group_members(response)
      response.collect { |kill| kill['GroupMembers'] }.flatten.collect do |member|
        member['Name']
      end
    end

    def extract_dropped_items(response)
      response.collect { |kill| kill['Victim'] }.flatten.collect do |victim|
        victim['Inventory'].compact
      end
    end

    def extract_players_killed(response)
      response.collect { |kill| kill['Victim'] }.flatten.collect do |victim|
        victim['Name']
      end
    end
  end

  # this is the class used to search for users, namely to get their API ID
  class UserSearch
    include HTTParty
    base_uri BASE_API_URL

    def initialize(character_name)
      @character_name = character_name
    end

    def find
      self.class.get("/search?q=#{character_name}")
    end

    private

    attr_accessor :character_name
  end
end
