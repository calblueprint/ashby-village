class AddRelationBetweenUserAndNeighborhood < ActiveRecord::Migration
  def change
  	add_column :groups, :neighborhood_id, :integer
  	add_index :groups, :neighborhood_id

  	add_column :neighborhoods, :group_id, :integer
  	add_index :neighborhoods, :group_id
  end
end
