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
#
# Indexes
#
#  index_characters_on_name  (name)
#

# when being created we also need to get their albion online character name somehow
# not totally sure how to do this properly yet
# potentially via a search api?

class Character < ApplicationRecord
  before_create :set_api_id

  private

  def set_api_id
    # in here we need to use some shit from the api to get the ID
    api_client = AlbionApi::UserSearch.new(self.name)
    response = api_client.api_id
    self.api_id = JSON.parse(response.body)
  end
end
