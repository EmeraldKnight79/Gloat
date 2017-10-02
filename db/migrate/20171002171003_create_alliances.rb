class CreateAlliances < ActiveRecord::Migration[5.1]
  def change
    create_table :alliances do |t|
      t.string :name
      t.string :api_id

      t.timestamps
    end
  end
end
