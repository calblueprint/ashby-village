class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # protected

  # def account_update_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :neighborhood)
  # end

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email) }
  # end

end
