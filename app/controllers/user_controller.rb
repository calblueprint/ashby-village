class UserController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@first_name = @user.first_name
  	@last_name = @user.last_name
  	@email = @user.email
  	@phone = @user.phone

  	@header = "My Profile"

  	if @user != current_user
  		@header = @user.first_name + "'s Profile"
  	end
  end

  def index
    if user_signed_in?
      redirect_to user_path
    end
  end

end
