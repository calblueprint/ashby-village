class AshbyMailer < ApplicationMailer
  include Roadie::Rails::Automatic
  default from: "ashbyvillagetest@gmail.com"

  def email_invites(user, group, event)
    @user = user
    @group = group
    @event = event
    mail(to: @user.email, subject: "You're Invited to " + @event.title + "!")
  end

  def email_reminders(user, group, event)
    @user = user
    @group = group
    @event = event
    mail(to: @user.email, subject: "Reminder: Event Tomorrow!")
  end

  def email_cancel(user, group, event)
    @user = user
    @group = group
    @event = event
    mail(to: @user.email, subject: @event.title + " Is Cancelled")
  end

  def email_repeat(user, group, event)
    @user = user
    @group = group
    @event = event
    mail(to: @user.email, subject: "You're Invited to " + @event.title + "!")
  end

  def email_updates(user, group, event)
    @user = user
    @group = event.group
    @event = event
    mail(to: user.email, subject: event.title + " has been updated!")
  end
end
