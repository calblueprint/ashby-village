class AddDefaultValueToInviteRsvp < ActiveRecord::Migration
  def change
    change_column :invites, :rsvp, :boolean, :default => false
  end
end
