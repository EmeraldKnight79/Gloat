# frozen_string_literal: true

# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  api_id     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_characters_on_name  (name)
#

require "#{Rails.root}/lib/albion-api.rb"

class Character < ApplicationRecord
  before_create :set_api_id

  has_many :gank_session_characters
  has_many :gank_sessions, through: :gank_session_characters

  def self.select_options
    all.collect do |character|
      [character.name, character.id]
    end
  end

  private

  def set_api_id
    # in here we need to use some shit from the api to get the ID
    # something like this
    api_client = AlbionApi::UserSearch.new(self.name)
    response = api_client.find
    self.api_id = response["players"].first["Id"]
  end
end
