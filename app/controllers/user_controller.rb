class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
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
