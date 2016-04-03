class AddDefaultValueToInvitesOrganizer < ActiveRecord::Migration
    def up
      change_column :invites, :organizer, :boolean, default: false
    end

    def down
      change_column :invites, :organizer, :boolean, default: nil
    end
end
