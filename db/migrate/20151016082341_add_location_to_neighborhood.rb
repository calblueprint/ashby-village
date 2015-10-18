class AddLocationToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :location, :string
  end
end
