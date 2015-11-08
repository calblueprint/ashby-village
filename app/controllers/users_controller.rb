class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  # def index
  #   @users = User.all.decorate
  # end

  def show
    @user = User.find(params[:id]).decorate
    @header = "My Profile"

    if @user != current_user
      @header = @user.first_name + "'s Profile"
    end
  end

  #   PUT /resource
  def edit
    @user = User.find(params[:id]).decorate
    render :template => "users/registrations/edit_profile"
  end

  # #   PUT /resource
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     flash[:success] = "Profile updated"
  #     redirect_to @user
  #   else
  #     render 'edit'
  #   end
  # end

  def update
  @user = User.find(params[:id])
  respond_to do |format|
    if @user.update_without_password(params[:user])
      format.html { redirect_to root_url, flash[:notice] = SUCCESSFUL_REGISTRATION_UPDATE_MSG }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
   end
end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end

end
