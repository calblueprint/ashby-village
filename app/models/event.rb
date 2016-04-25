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
#  capacity    :integer
#

class Event < ActiveRecord::Base

  belongs_to :group
  has_many :posts
  has_many :invites, dependent: :destroy
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
      Invite.create(user: user, event: self, organizer: true, rsvp: current_user == user)
    end
    self.group.users.each do |user|
      unless self.users.include?(user)
        Invite.create(user: user, event: self, organizer: false)
      end
    end
    @group = Group.find(self.group_id)
    @group.users.each do |user|
      AshbyMailer.email_invites(user, @group, self).deliver
    end
  end

  def self.send_reminders
    self.where("startdate - ? = 1", DateTime.now.to_date).find_each do |event|
      @group = Group.find(event.group_id) # get event's group
      event.users.rsvps.each do |user|
        AshbyMailer.email_reminders(user, @group, event).deliver
      end
    end
  end

  def self.repeat_events
    self.where(repeat_weekly: true).each do |e|
      if e.enddate < DateTime.now.to_date
        e.startdate += 7.days
        e.enddate += 7.days
        e.save
        e.clear_rsvp
        e.repeat_invite
      end
    end
    self.where(repeat_monthly: true).each do |e|
      if e.enddate < DateTime.now.to_date
        e.startdate += 4.weeks
        e.enddate += 4.weeks
        e.save
        e.clear_rsvp
        e.repeat_invite
      end
    end
  end

  def clear_rsvp
    self.invites.each do |i|
      if i.organizer == false
        i.update_attribute :rsvp, false
      end
    end
  end

  def self.send_invites
  end

  def repeat_invite
    @group = Group.find(self.group_id)
    @group.users.each do |user|
      AshbyMailer.email_repeat(user, @group, self).deliver
    end
  end

  def send_cancel
    @group = Group.find(self.group_id)
    self.users.rsvps.each do |user|
      AshbyMailer.email_cancel(user, @group, self).deliver
    end
  end

  validate :event_starttime_later_than_now, :event_endtime_later_than_starttime

  def event_starttime_later_than_now
    if starttime.present? && startdate.present?
      if startdate < DateTime.now.to_date
        errors.add(:startdate, "Your event cannot start in the past!")
      elsif startdate == DateTime.now.to_date && starttime.to_s(:time) < Time.now.to_s(:time)
        errors.add(:Starttime, "Your event cannot start in the past!")
      end
    end
  end

  def event_endtime_later_than_starttime
    if enddate.present? && endtime.present?
      if enddate < startdate
        errors.add(:enddate, "Your event cannot end before it starts!")
      elsif endtime.to_s(:time) < starttime.to_s(:time) && enddate == startdate
        errors.add(:endtime, "Your event cannot end before it starts!")
      end
    end
  end
end
