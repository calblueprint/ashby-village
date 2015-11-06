class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

# Allows for updating without requiring current password
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

#   PUT /resource
  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = current_user
    if update_resource(@user,account_update_params)
      sign_in(current_user, :bypass => true) #keeps user signed in after changing password
      flash[:notice] = "Password updated!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Edit failed."
      render :template => "users/registrations/edit"
    end
  end

#   DELETE /resource
#   def destroy
#     super
#   end

#   GET /resource/cancel
#   Forces the session data which is usually expired after sign
#   in to be expired now. This is useful if the user wants to
#   cancel oauth signing in/up in the middle of the process,
#   removing all OAuth session data.
#   def cancel
#     super
#   end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:registration) { |u| u.permit(:first_name, :last_name, :email, :password, :phone, :neighborhood, :photo) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password) }
  end

#   If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :email, :neighborhood, :password, :password_confirmation, :phone, :photo]
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << [:password, :password_confirmation, :current_password]
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def account_update_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

  def registration_params
    params.require(:user).permit( :first_name, :last_name, :email, :neighborhood, :password, :password_confirmation, :phone, :photo)
  end

#   The path used after sign up for inactive accounts.
#   def after_inactive_sign_up_path_for(resource)
#     super(resource)
#   end
end
