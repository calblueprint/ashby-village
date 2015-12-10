class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  #
  # # POST /resource/sign_in
  # def create
  #   byebug
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_flashing_format?
  #   byebug
  #   if sign_in(resource_name, resource)
  #     respond_to do |format|
  #       format.js { flash[:notice] = "haah yee!" }
  #     end
  #     redirect_to groups_path
  #   else
  #     respond_to do |format|
  #       format.js { flash[:notice] = "nahhhh try again doe!" }
  #     end
  #   end
  # end
  #
  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
