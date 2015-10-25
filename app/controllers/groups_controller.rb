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
