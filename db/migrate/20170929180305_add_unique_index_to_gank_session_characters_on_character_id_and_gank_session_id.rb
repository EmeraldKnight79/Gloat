class AddUniqueIndexToGankSessionCharactersOnCharacterIdAndGankSessionId < ActiveRecord::Migration[5.1]
  def change
    add_index :gank_session_characters, [:character_id, :gank_session_id], unique: true, name: 'unique_character_per_session_index'
  end
end
