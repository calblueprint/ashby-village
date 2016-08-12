class AshbyMailer < ApplicationMailer
  default from: "ashbyvillagetest@gmail.com"

  def email_admin(email, problem)
    @problem = problem
    @email = email
    mail(to: "joeypereira94@gmail.com; joeypereira@berkeley.edu", subject: "[Ashby Tech] user problem")
  end

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

  def email_reply(user, original_user, post, group)
    @user = user
    @original_user = original_user
    @group = group
    @post = post
    mail(to: @original_user.email, subject: @original_user.full_name.to_s + " replied to your post")
  end

  def email_updates(user, group, event)
    @user = user
    @group = event.group
    @event = event
    mail(to: user.email, subject: event.title + " has been updated!")
  end
end
