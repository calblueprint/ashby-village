class AddNhReferenceToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :neighborhood_id, :integer
  	add_index :groups, :neighborhood_id
  end
end
