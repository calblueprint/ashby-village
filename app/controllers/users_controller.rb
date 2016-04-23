class UsersController < ApplicationController
  # TODO(Shimmy): before_action :logged_in_user, only: [:index, :update, :edit].
  # TODO(Shimmy): Get rid of the redundant controller for User.

  # GET /users

  def index
    @users = User.all.decorate
  end

  def new
    @user = User.new
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
      flash[:alert] = "Unable to edit profile."
    end
  end

  def notifications
    @email_notif = current_user.global_email_notifications
    if @email_notif == true
      if current_user.update_attribute(:global_email_notifications, false)
        flash[:notice] = "Your email notifications are now off."
        redirect_to user_path(current_user)
      end
    elsif @email_notif == false
      if current_user.update_attribute(:global_email_notifications, true)
        flash[:notice] = "Your email notifications are now on."
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = "Email notification preferences could not be updated."
      redirect_to account_settings_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :bio, :photo)
  end

end
