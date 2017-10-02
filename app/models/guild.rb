# frozen_string_literal: true

# == Schema Information
#
# Table name: guilds
#
#  id          :integer          not null, primary key
#  name        :string
#  api_id      :string
#  alliance_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'albion-api'

# this is the model for a guild in Albion
class Guild < ApplicationRecord
  belongs_to :alliance
  has_many :characters

  before_validation :set_api_info, on: :create
  after_create :generate_members

  private

  def set_api_info
    response = AlbionApi::GuildSearch.new(name).find
    self.api_id = response.guild_api_id
    self.alliance_id = Alliance.find_or_create_by(
      name: response.alliance_name,
      api_id: response.alliance_api_id
    ).id
  end

  def generate_members
    members_response = AlbionApi::GuildMembers.new(api_id).find
    members_response.members.each do |member|
      character = Character.find_or_initialize_by(name: member['Name'])
      if character.new_record? || character.guild_id != id
        character.guild_id = id
        character.save(validate: false)
      end
    end
  end
end
