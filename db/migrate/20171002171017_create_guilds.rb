class CreateGuilds < ActiveRecord::Migration[5.1]
  def change
    create_table :guilds do |t|
      t.string :name
      t.string :api_id
      t.integer :alliance_id

      t.timestamps
    end
  end
end
