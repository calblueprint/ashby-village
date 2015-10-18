class AddDetailsToUserNeighborhood < ActiveRecord::Migration
  def change
    add_column :user_neighborhoods, :neighborhood_id, :integer
    add_column :user_neighborhoods, :user_id, :integer
  end
end
