class AddTextToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :text, :string
  end
end
