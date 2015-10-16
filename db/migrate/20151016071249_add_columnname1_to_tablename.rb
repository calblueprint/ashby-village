class AddColumnname1ToTablename < ActiveRecord::Migration
  def change
    add_column :tablenames, :location, :string
  end
end
