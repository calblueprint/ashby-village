class AddEventIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :event_id, :integer
    add_foreign_key :posts, :events
  end
end
