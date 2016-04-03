class AddOrganizerToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :organizer, :boolean
  end
end
