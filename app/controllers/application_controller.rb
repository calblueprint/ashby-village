class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def auth_user!
    if !user_signed_in?
      flash[:error] = "userauth"
      redirect_to root_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :email << :phone << :password << :password_confirmation << :neighborhood << :photo
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :email << :phone << :photo << :password << :password_confirmation << :current_password
  end

end
