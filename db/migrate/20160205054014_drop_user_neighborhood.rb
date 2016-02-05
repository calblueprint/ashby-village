class DropUserNeighborhood < ActiveRecord::Migration
  def change
    drop_table :user_neighborhoods
  end
end
