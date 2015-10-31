class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @neighborhoods = Neighborhood.all
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def new
    @group = Group.new
  end

  def json
    @neighborhood = Neighborhood.find(params[:id]);
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
    params.require(:group).permit(:name, :description)
  end
end

