class AshbyMailer < ApplicationMailer
  default from: "ashbyvillagetest@gmail.com"

  def email_invites(user, group, event)
    @user = user
    @group = group
    @event = event
    mail(to: @user.email, subject: "You're invited!")
  end
end
