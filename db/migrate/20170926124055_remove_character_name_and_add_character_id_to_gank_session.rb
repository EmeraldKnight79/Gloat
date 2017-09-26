class RemoveCharacterNameAndAddCharacterIdToGankSession < ActiveRecord::Migration[5.1]
  def change
    remove_column :gank_sessions, :character_name
    add_column :gank_sessions, :character_id, :integer
  end
end
