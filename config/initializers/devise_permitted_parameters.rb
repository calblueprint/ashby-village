module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :phone << :addressL1 << :addressL2 << :city << :postalCode << :province
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :phone << :addressL1 << :addressL2 << :city << :postalCode << :province
  end

end

DeviseController.send :include, DevisePermittedParameters