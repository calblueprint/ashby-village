class UsersController < ApplicationController
  # TODO(Shimmy): before_action :logged_in_user, only: [:index, :update, :edit].
  # TODO(Shimmy): Get rid of the redundant controller for User.

  # GET /users
  def index
    @users = User.all.decorate
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def edit
    @user = User.find(params[:id]).decorate
    render template: "users/registrations/edit_profile"
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      @user.update_attributes(user_params)
      flash[:notice] = "Profile updated!"
      redirect_to user_path
    else
      render action: "edit"
      # TODO(Shannon): Verification for edit profiles?
      flash[:alert] = "Error!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :photo)
  end

end
