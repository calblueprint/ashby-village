class ChangeNeighborhoodName < ActiveRecord::Migration
  def change
    rename_column :neighborhoods, :title, :name
  end
end
