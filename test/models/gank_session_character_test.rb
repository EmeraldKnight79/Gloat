# == Schema Information
#
# Table name: gank_session_characters
#
#  id              :integer          not null, primary key
#  gank_session_id :integer
#  character_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_gank_session_characters_on_character_id     (character_id)
#  index_gank_session_characters_on_gank_session_id  (gank_session_id)
#

require 'test_helper'

class GankSessionCharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
