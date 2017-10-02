class AddGuildIdToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :guild_id, :integer, index: true
  end
end
