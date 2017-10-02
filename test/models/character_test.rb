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

require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
