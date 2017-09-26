# frozen_string_literal: true
# == Schema Information
#
# Table name: gank_sessions
#
#  id           :integer          not null, primary key
#  start_time   :datetime
#  end_time     :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer
#
# Indexes
#
#  index_gank_sessions_on_end_time    (end_time)
#  index_gank_sessions_on_start_time  (start_time)
#

class GankSession < ApplicationRecord
  before_create :set_start_time

  belongs_to :character

  private

  def set_start_time
    self.start_time = Time.now
  end
end
