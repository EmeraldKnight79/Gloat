class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name, index: true
      t.string :api_id

      t.timestamps
    end
  end
end
