class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      redirect_to controller: "registrations", action: "new", sign_up_params: sign_up_params
    end
  end

  def new
    if params[:sign_up_params]
      @user = User.new(params[:sign_up_params].permit(:first_name, :last_name, :email, :phone))
      @resubmit = 1
    else
      @user = User.new()
      @resubmit = 0
    end
    @allemails = User.all.map(&:email)
  end

#   PUT /resource
  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = current_user
    if update_resource(@user,account_update_params)
      sign_in(current_user, bypass: true) # keeps user signed in after changing password
      flash[:notice] = "Password updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Unable to edit password. Please make sure current password is correct and new passwords match."
      render template: "users/registrations/edit"
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
    groups_path
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
