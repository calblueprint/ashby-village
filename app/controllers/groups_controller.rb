class GroupsController < ApplicationController

  # TODO (Shimmy): Only display this page if the user is logged in
  def index
    @groups = Group.all
    @neighborhoods = Neighborhood.all
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
        @group.add_user(current_user, make_leader=true)
        format.html { redirect_to @group, notice: "Group was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def member_listing
    @group = Group.friendly.find(params[:id])
  end

  def leave_group
    #if you're leader - alert - can't leave if there are no other leaders
    #if you're a member or one leader amongst many others you can leave
    @group = Group.friendly.find(params[:id])
    @group.current_user.delete
  end

  def group_params
    params.require(:group).permit(:name, :description, :neighborhood_id, :kind)
  end

end
