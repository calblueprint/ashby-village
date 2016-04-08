class AshbyMailer < ApplicationMailer
  default from: "ashbyvillagetest@gmail.com"

  def email_invites(user)
    @user = user
    mail(to: @user.email, subject: "You're invited!")
  end
end
