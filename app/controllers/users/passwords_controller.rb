class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    if resource.errors.empty?
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      respond_with resource, location: root_path
    else

      # Redirect to custom page instead of displaying errors

      flash[:error] = "password_reset"
      redirect_to root_path
      # respond_with_navigational(resource){ render_with_scope :new }

    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions

  protected

  def after_sending_reset_password_instructions_path_for(resource_name)
    return root_path
  end
end
