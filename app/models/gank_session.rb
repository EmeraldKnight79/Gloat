# frozen_string_literal: true

# == Schema Information
#
# Table name: gank_sessions
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_gank_sessions_on_end_time    (end_time)
#  index_gank_sessions_on_start_time  (start_time)
#

class GankSession < ApplicationRecord
  before_create :set_start_time

  has_many :gank_session_characters
  has_many :characters, through: :gank_session_characters

  accepts_nested_attributes_for :gank_session_characters

  def end_session
    self.end_time ||= Time.now
    unless self.changed.empty?
      items_dropped = []
      characters.each do |character|
        client = AlbionApi::UserKillboard.new(character.api_id)
        response = client.top_kills_in_range(start_time, end_time)
        puts response.items_dropped
        items_dropped << response.items_dropped
      end
      flat_items = items_dropped.flatten
      flat_items = flat_items.group_by do |item|
        item['Type']
      end
      grouped_items = flat_items.map do |type, items|
        {
          type: type,
          quantity: items.reduce(0) { |sum, item| sum + item['Count'] }
        }
      end
      self.items_dropped = grouped_items
      save!
    end
  end

  private

  def set_start_time
    self.start_time = Time.now
  end
end
