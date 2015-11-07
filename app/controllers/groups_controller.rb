class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.friendly.find(params[:id])
    @users = @group.users
    @neighborhood = Neighborhood.find(@group.neighborhood_id)
    @neighborhood_name = @neighborhood.name
  end

  def new
    @group = Group.new
    @neighborhoods = Neighborhood.all.map{|u| [ u.name, u.id ] }

    if current_user
     @user = current_user
    else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def member_listing
    @group = Group.friendly.find(params[:id])
    @members = @group.users
  end

  def group_params
    params.require(:group).permit(:name, :description, :neighborhood_id)
  end
end

