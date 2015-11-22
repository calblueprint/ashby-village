class GroupsController < ApplicationController

  # TODO (Shimmy): Only display this page if the user is logged in
  def index
    @groups = Group.all
    @neighborhoods = Neighborhood.all
    my = params[:format]
    if my.nil?
      @all = "selected = \"selected\"".html_safe
      @my = "".html_safe
    else
      @my = "selected = \"selected\"".html_safe
      @all = "".html_safe
    end
  end

  def show
    @post = Post.new
    @group = Group.friendly.find(params[:id])
    @posts = @group.posts.order_by_created_at
    @neighborhood = Neighborhood.find(@group.neighborhood_id)
  end

  def new
    if current_user
      @group = Group.new
      @kinds = Group.kinds.keys
      @neighborhoods = Neighborhood.all.map { |u| [u.name, u.id] }
    else
      redirect_to new_user_session_path, notice: "You are not logged in."
    end
  end

  # When User creates group, create a UserGroup with is_leader: true
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        @group.add_user(current_user, make_leader = true)
        format.html { redirect_to @group, notice: "Group was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def member_listing
    @group = Group.friendly.find(params[:id])
  end

  def join
    @group = Group.friendly.find(params[:id])
    if not @group.users.include?(current_user)
      @group.add_user(current_user)
    end
  end

  def leave
    @group = Group.friendly.find(params[:id])
    @group.remove_user(current_user)
    redirect_to groups_path, notice: "You have successfully left the group"
  end

  def group_params
    params.require(:group).permit(:name, :description, :neighborhood_id, :kind)
  end

end
