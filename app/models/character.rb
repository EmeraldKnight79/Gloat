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
#  guild_id   :integer
#
# Indexes
#
#  index_characters_on_name  (name)
#

require 'albion-api'

# the character model
class Character < ApplicationRecord
  before_validation :set_api_info, on: :create

  belongs_to :guild
  has_one :alliance, through: :guild

  has_many :gank_session_characters
  has_many :gank_sessions, through: :gank_session_characters

  def self.select_options
    all.collect do |character|
      [character.name, character.id]
    end
  end

  private

  def set_api_info
    # in here we need to use some shit from the api to get the ID
    # something like this
    api_client = AlbionApi::UserSearch.new(name)
    response = api_client.find
    self.api_id = response.api_id
    self.guild_id = Guild.find_or_create_by(name: response.guild_name).id
  end
end
