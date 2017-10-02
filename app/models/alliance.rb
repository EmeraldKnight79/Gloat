# frozen_string_literal: true

# == Schema Information
#
# Table name: alliances
#
#  id         :integer          not null, primary key
#  name       :string
#  api_id     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# this is the model for an alliance in Albion
class Alliance < ApplicationRecord
  has_many :guilds
end
