class AddNeighborhoodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :neighborhood, :string
  end
end
