class AddItemsDroppedToGankSession < ActiveRecord::Migration[5.1]
  def change
    add_column :gank_sessions, :items_dropped, :json, default: {}
  end
end
