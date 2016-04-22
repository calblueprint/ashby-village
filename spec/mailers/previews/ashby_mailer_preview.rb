# Preview all emails at http://localhost:3000/rails/mailers/ashby_mailer
class AshbyMailerPreview < ActionMailer::Preview
  def ashby_mail_preview
    AshbyMailer.email_invites(User.all)
  end
end
