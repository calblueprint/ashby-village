class RemoveNeighborhoodFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :neighborhood
  end
end
