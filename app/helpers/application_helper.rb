module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Devise proides a current_user helper.
  # However, this helper returns an instance of User - without your decorators.
  # This enable decorators.
  def current_user
    UserDecorator.decorate(super) if super.present?
  end

end
