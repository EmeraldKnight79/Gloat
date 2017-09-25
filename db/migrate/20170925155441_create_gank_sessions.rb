class CreateGankSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :gank_sessions do |t|
      t.string :character_name, index: true
      t.datetime :start_time, index: true
      t.datetime :end_time, index: true

      t.timestamps
    end
  end
end
