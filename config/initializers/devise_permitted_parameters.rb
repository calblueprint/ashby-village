module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:registration) << :first_name << :last_name << :phone << :neighborhood << :photo
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :phone << :neighborhood << :photo

end

DeviseController.send :include, DevisePermittedParameters