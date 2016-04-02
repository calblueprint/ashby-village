class AshbyMailer < ApplicationMailer
  default from: "ashbyvillagetest@gmail.com"

  def email_invites(users)
    @users = users
    @users.each do |user|
      @each_user = user
      mail(to: user.email, subject: "You're invited!")
  end
end
