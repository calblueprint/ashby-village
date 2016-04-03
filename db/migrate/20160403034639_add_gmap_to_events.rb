class AddGmapToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gmap, :boolean, default: false
  end
end
