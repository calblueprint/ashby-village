class GroupsController < ApplicationController
  autocomplete :user, :full_name, full: true
  autocomplete :group, :name, { full: true }

  def autocomplete_group_name
    term = params[:term].downcase
    neighborhood = Group.neighborhoods[params[:neighborhood].gsub("^", " ")] || "all"
    if neighborhood == "all"
      groups = Group.where('lower(name) LIKE ?', "%#{term}%").order(:name).all
    else
      groups = Group.where('neighborhood = ? AND lower(name) LIKE ?', neighborhood, "%#{term}%").order(:name).all
    end
    render json: groups.map { |g| {id: g.id, label: g.name, value: g.name} }
  end

  # TODO(Shimmy): Only display this page if the user is logged in
  def index
    # TODO(Shimmy):Make scopes for these
    @groups = Group.all
    @neighborhoods = Group.neighborhoods.keys
    my = params[:format]
    if my.nil?
      @all = "selected = \"selected\"".html_safe
      @my = "".html_safe
    else
      @my = "selected = \"selected\"".html_safe
      @all = "".html_safe
    end
  end

  def my_index
    @groups = UserGroup.where(user: current_user).map(&:group)
  end

  def show
    @post = Post.new
    @reply = Reply.new
    @group = Group.friendly.find(params[:id])
    @posts = @group.posts.where(event_id: nil).order_by_created_at
    @event_id = nil
    @group_id = @group.id
    @neighborhood = @group.neighborhood
  end

  def new
    if current_user
      @group = Group.new
      @neighborhoods = Group.neighborhoods.keys
      @allnames = Group.all.map(&:name)
      render action: "new", notice: "Sample notice"
    else
      redirect_to new_user_session_path, notice: "You are not logged in."
    end
  end

  # When User creates group, create a UserGroup with is_leader: true
  def create
    @group = Group.new(group_params)
    if @group.save
      if !params[:selected_leaders].blank?
        @users = User.find(params[:selected_leaders].split(","))
        if !@users.include?(current_user)
          @group.add_user(current_user, make_leader = true)
        end
        @users.each do |user|
          @group.add_user(user, make_leader = true)
        end
      else # remember to always add current user as leader
        @group.add_user(current_user, make_leader = true)
      end
      redirect_to @group, notice: "Group was successfully created."
    else
      @neighborhoods = Group.neighborhoods.keys
      flash[:notice] = "Name has already been taken!"
      render :new
    end
  end

  def member_listing
    @group = Group.friendly.find(params[:id])
  end

  def join
    @group = Group.friendly.find(params[:id])
    if not @group.users.include?(current_user)
      @group.add_user(current_user)
      redirect_to @group
    end
  end

  def leave
    @group = Group.friendly.find(params[:id])
    @group.remove_user(current_user)
    hash = {state: "active"}
    if @group.inactive?
      hash = {state: "inactive"}
    end
    respond_to do |format|
      format.html { redirect_to groups_path, flash: {notice: "Successfully removed your membership from #{@group.name}"}}
      format.json { render json: hash }
    end
    # redirect_to groups_path, notice: "You have successfully left the group"
  end

  def edit
    @group = Group.friendly.find(params[:id])
    @users = User.where.not(id: @group.users.leaders.pluck(:id)).decorate.map{ |u| [u.full_name, u.id]}
    @neighborhoods = Group.neighborhoods.keys
  end

  def update
    @group = Group.friendly.find(params[:id])
    if @group.update_attributes(group_params)
      @group.users.leaders.each do |user|
        @group.remove_user(user)
      end
      if !params[:selected_leaders].blank?
        params[:selected_leaders].split(",").each do |slid|
          @group.add_user(User.find(slid.to_i), make_leader = true)
        end
        @group.update_attribute(:state, Group.states["active"])
      end
      flash[:notice] = "Group updated!"
      redirect_to group_path
    else
      render :edit
      #TODO: Fix error message
      flash[:alert] = "Unable to update group."
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :neighborhood, :photo)
  end

end
