class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]


# before_filter :configure_permitted_parameters, :only => [:create]
before_filter :configure_permitted_parameters, if: :devise_controller?

protected

def registration_params
  params.require(:user).permit( :first_name, :last_name, :email, :neighborhood, :password, :password_confirmation)
end

def account_update_params
  params.require(:user).permit(:first_name, :last_name, :email, :phone)
end

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:registration) { |u| u.permit(:first_name, :last_name, :email, :password, :phone, :neighborhood, :photo ) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :phone) }
end

#   GET /resource/sign_up
#   def new
#   end

#   POST /resource
  def create
    @user = User.new
    @user.save
    redirect_to groups_show_path
  end

#   GET /resource/edit
#   def edit
#     super
#   end

#   PUT /resource
  def update
    @user = current_user
    puts @user
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated!"
      redirect_to @user
    else
      flash[:notice] = "Edit failed."
      redirect to user_path
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

#   protected

#   If you have extra params to permit, append them to the sanitizer.
#   def configure_sign_up_params
#     devise_parameter_sanitizer.for(:sign_up) << :attribute
#   end

#   If you have extra params to permit, append them to the sanitizer.
#   def configure_account_update_params
#     devise_parameter_sanitizer.for(:account_update) << :attribute
#   end

#   The path used after sign up.
#   def after_sign_up_path_for(resource)
#     super(resource)
#   end

#   The path used after sign up for inactive accounts.
#   def after_inactive_sign_up_path_for(resource)
#     super(resource)
#   end
end