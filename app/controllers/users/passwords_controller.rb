class Users::PasswordsController < Devise::PasswordsController
  skip_before_filter :require_no_authentication, :only => [:edit, :update]

  def new
    super
  end

  def edit
    super
  end

  def update
    # self.resource = resource_class.reset_password_by_token(params[resource_name])
    if resource.errors.empty?
      sign_out(resource_name)
      sign_in(resource_name, resource)
    end
  end

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
