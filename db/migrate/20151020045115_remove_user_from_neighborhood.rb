class RemoveUserFromNeighborhood < ActiveRecord::Migration
  def change
  	remove_column :neighborhoods, :user 
  end
end
