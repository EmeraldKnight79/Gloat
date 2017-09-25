# frozen_string_literal: true

# == Schema Information
#
# Table name: gank_sessions
#
#  id             :integer          not null, primary key
#  character_name :string
#  start_time     :datetime
#  end_time       :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_gank_sessions_on_character_name  (character_name)
#  index_gank_sessions_on_end_time        (end_time)
#  index_gank_sessions_on_start_time      (start_time)
#

class GankSession < ApplicationRecord
  before_create :set_start_time

  private

  def set_start_time
    self.start_time = Time.now
  end
end
