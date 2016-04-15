# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  starttime   :time
#  endtime     :time
#  startdate   :date
#  enddate     :date
#  group_id    :integer
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  gmap        :boolean          default(FALSE)
#

class Event < ActiveRecord::Base

  belongs_to :group

  has_many :invites
  has_many :users, through: :invites do
    def rsvps
      where("invites.rsvp = ?", true)
    end

    def organizers
      where("invites.organizer = ?", true)
    end
  end

  def add_users(current_user, organizers)
    @event_organizers = [current_user]
    if organizers
      @event_organizers.concat(User.find(organizers))
    end
    @event_organizers.each do |user|
      Invite.create(user: user, event: self, organizer: true)
    end
    self.group.users.each do |user|
      unless self.users.include?(user)
        Invite.create(user: user, event: self, organizer: false)
      end
    end
  end

end
