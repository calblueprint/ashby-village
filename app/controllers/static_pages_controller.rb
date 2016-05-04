class StaticPagesController < ApplicationController
  def home
    # if user_signed_in?
    #   redirect_to groups_index_path
    # end
    @allemails = User.all.map(&:email)
  end

  def help
  end

  def helpme
    AshbyMailer.delay.email_admin(params[:email], params[:problem])
    flash[:notice] = "Administrators have been notified"
    redirect_to :back 
  end

  def about
  end
end
