class CreateGankSessionCharacters < ActiveRecord::Migration[5.1]
  def change
    remove_column :gank_sessions, :character_id

    create_table :gank_session_characters do |t|
      t.integer :gank_session_id, index: true
      t.integer :character_id, index: true

      t.timestamps
    end
  end
end
