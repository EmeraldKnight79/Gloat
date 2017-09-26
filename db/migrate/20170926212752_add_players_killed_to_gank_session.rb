class AddPlayersKilledToGankSession < ActiveRecord::Migration[5.1]
  def change
    add_column :gank_sessions, :players_killed, :json, default: []
  end
end
