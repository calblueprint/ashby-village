class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users

    @nh_id = @group.neighborhood_id
    @neighborhood = Neighborhood.find(@nh_id)
    @neighborhood_name = @neighborhood.title
  end

  def new
    @group = Group.new
    @neighborhoods = Neighborhood.all.map{|u| [ u.title, u.id ] }
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

  def group_params
    params.require(:group).permit(:name, :description, :neighborhood_id)
  end
end

