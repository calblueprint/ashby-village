class GroupsController < ApplicationController
  def index
  	@groups = Group.all
  end

  def show
  	# @group = Group.first
  	# @title = @group.name
  	@group = Group.find(params[:id])
  	# debugger
  end

  def new
    @group = Group.new
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


