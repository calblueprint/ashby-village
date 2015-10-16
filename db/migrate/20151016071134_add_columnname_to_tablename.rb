class AddColumnnameToTablename < ActiveRecord::Migration
  def change
    add_column :tablenames, :description, :string
  end
end
