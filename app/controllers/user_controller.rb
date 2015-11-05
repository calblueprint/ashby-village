class UserController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all.decorate
  end

  def show
    @user = User.find(params[:id]).decorate
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

  def edit_password
    render :template => "users/registrations/edit_password"
  end
end
