class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
  end

  def new
    @neighborhood = Neighborhood.find params[:neighborhood_id]
    @group = @neighborhood.groups.build
  end

  def create
    @neighborhood = Neighborhood.find params[:neighborhood_id]
    @group = @neighborhood.groups.build group_params
    if @group.save
      redirect_to neighborhood_group_path @neighborhood, @group, notice: "Group was successfully created."
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
