require 'httparty'

BASE_API_URL = "https://gameinfo.albiononline.com/api/gameinfo".freeze

# this module contains all of the classes needed to make requests to the Albion Online API
module AlbionApi
  # this class can make the calls to the UserKillboard APIs
  class UserKillboard
    include HTTParty
    base_uri BASE_API_URL

    attr_accessor :character_api_id

    def initialize(character_api_id)
      @character_api_id = character_api_id
    end

    def top_kills
      self.class.get("/#{@character_api_id}/top_kills")
    end
  end

  # this is the class used to search for users, namely to get their API ID
  class UserSearch
    include HTTParty
    base_uri BASE_API_URL

    attr_accessor :character_name

    def initialize(character_name)
      @character_name = character_name
    end

    def find
      self.class.get("/search?q=#{character_name}")
    end
  end
end
