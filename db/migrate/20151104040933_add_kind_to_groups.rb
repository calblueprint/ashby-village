class AddKindToGroups < ActiveRecord::Migration
  def change
		add_column :groups, :type, :integer
  end
end
