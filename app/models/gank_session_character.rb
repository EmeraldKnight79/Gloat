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
#  unique_character_per_session_index                (character_id,gank_session_id) UNIQUE
#

class GankSessionCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :gank_session

  validates_uniqueness_of :character_id, scope: :gank_session_id
end
