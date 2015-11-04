class AddKindToGroups < ActiveRecord::Migration
  def change
		add_column :groups, :kind, :integer
  end
end
