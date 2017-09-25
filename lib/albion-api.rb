require 'httparty'

# this module contains all of the classes needed to make requests to the Albion Online API
module AlbionApi
  class << self
    attr_accesor :base_api_url
  end

  self.base_api_url = "https://api.albiononline.com"

  # this class can make the calls to the UserKillboard APIs
  class UserKillboard
    include HTTParty
    base_uri self.base_api_url+"/killboard"

    attr_accesor :character_api_id

    def initialize(character_api_id)
      @character_api_id = character_api_id
    end

    def top_kills
      self.class.get("/#{@character_api_id}/top_kills")
    end
  end
end
