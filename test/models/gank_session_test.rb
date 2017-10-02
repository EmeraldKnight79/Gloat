# == Schema Information
#
# Table name: gank_sessions
#
#  id             :integer          not null, primary key
#  start_time     :datetime
#  end_time       :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  items_dropped  :json
#  players_killed :json
#
# Indexes
#
#  index_gank_sessions_on_end_time    (end_time)
#  index_gank_sessions_on_start_time  (start_time)
#

require 'test_helper'

class GankSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
