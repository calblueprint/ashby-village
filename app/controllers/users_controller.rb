class UsersController < ApplicationController

  # GET /users
  def show
    @user = User.find(params[:id]).decorate
    @header = "My Profile"

    if @user != current_user
      @header = @user.first_name + "'s Profile"
    end
  end

  #   PUT /resource
  def edit
    @user = User.find(params[:id]).decorate
    render :template => "users/registrations/edit_profile"
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      @user.update_attributes(user_params)
      flash[:notice] = "Profile updated!"
      redirect_to user_path
    else
      render action: "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :photo)
  end

end
