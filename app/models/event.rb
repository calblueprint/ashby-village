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
    self.group.users.each do |user|
      if notify?(user)
        AshbyMailer.delay.email_invites(user, self.group, self)
      end
    end
  end

  def update_organizers(current_user, organizers)
    @event_organizers = [current_user]
    if organizers
      @event_organizers.concat(User.find(organizers))
    end
    # Remove previous organizers
    self.users.organizers.each do |org|
      if not @event_organizers.include? org
        Invite.where(user: org, event: self).first.update_attribute(:organizer, false)
      end
    end
    @event_organizers.each do |user|
      if self.users.organizers.include? user
        # already organzier
      elsif self.users.include? user # already invited but not organizer
        Invite.where(user: user, event: self).first.update_attribute(:organizer, true)
      else # not invited yet
        Invite.create(user: user, event: self, organizer: true, rsvp: current_user == user)
      end
    end
    self.users.each do |user|
      if notify?(user)
        AshbyMailer.delay.email_updates(user, self.group, self)
      end
    end
  end

  def notify?(user)
    return user.global_email_notifications && !UserGroup.where(user: user, group: self.group).first.nil? && UserGroup.where(user: user, group: self.group).first.group_email_notifications
  end

  def self.send_reminders
    self.where("startdate - ? = 1", DateTime.now.to_date).find_each do |event|
      event.users.rsvps.each do |user|
        if event.notify?(user)
          AshbyMailer.delay.email_reminders(user, event.group, event)
        end
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
    # remove expired events
    self.where("repeat_weekly = ? AND repeat_monthly = ? and enddate < ?", false, false, DateTime.now).each do |e|
      e.destroy
    end
  end

  def clear_rsvp
    self.invites.each do |i|
      if !i.organizer
        i.update_attribute :rsvp, false
      end
    end
  end

  def self.send_invites
  end

  def repeat_invite
    self.group.users.each do |user|
      if notify?(user)
        AshbyMailer.delay.email_repeat(user, self.group, self)
      end
    end
  end

  def send_cancel
    self.users.rsvps.each do |user|
      if notify?(user)
        AshbyMailer.delay.email_cancel(user, self.group, self)
      end
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
