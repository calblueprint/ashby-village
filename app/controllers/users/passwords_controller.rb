class Users::PasswordsController < Devise::PasswordsController
  skip_before_filter :require_no_authentication, :only => [:edit, :update]

  # def new
  #   super
  # end

  # def edit
  #   super
  # end

  def update
    if current_account.update_with_password(params[:account])
      sign_in(current_account, :bypass => true)
      flash[:notice] = 'Password updated.'
      redirect_to account_path
    else
      render :action => :show
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
