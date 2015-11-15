class GroupsController < ApplicationController

  # TODO (Shimmy): Only display this page if the user is logged in
  def index
    @groups = Group.all
    @neighborhoods = Neighborhood.all
  end

  def show
    @group = Group.friendly.find(params[:id])
    @posts = @group.posts
    @users = @group.users
    @neighborhood = Neighborhood.find(@group.neighborhood_id)
    @neighborhood_name = @neighborhood.name
  end

  def new
    if current_user
      @group = Group.new
      @neighborhoods = Neighborhood.all.map{|u| [ u.name, u.id ] }
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  # When User creates group, create a UserGroup with is_leader: true
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
<<<<<<< HEAD
        User.all.each do |user|
          user_group = UserGroup.new(user: user, group: @group)
          if user == current_user
            user_group.update(is_member: true, is_leader: true)
          end
          user_group.save
        end
=======
        @group.add_user(current_user, make_leader=true)
>>>>>>> 3405d0bcdf4442570b04130fbf413c079f6833c5
        format.html { redirect_to @group, notice: "Group was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def member_listing
    @group = Group.friendly.find(params[:id])
    user_ids = @group.user_groups.where(is_member: true).pluck(:user_id)
    @members = User.find_by(id: user_ids)
  end

  def group_params
    params.require(:group).permit(:name, :description, :neighborhood_id)
  end
end
