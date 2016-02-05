class RemoveNeighborhoodFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :neighborhood, :string
  end
end
