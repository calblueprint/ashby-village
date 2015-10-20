class GroupsController < ApplicationController
  def index
  	# @groups = Group.paginate(:page => params[:page])
  	# @title = "All groups"
  	@groups = Group.all
  end

  def show
  	# @group = Group.third
  	# @title = @group.name
  	# @user = Group.find(params[:id])
  end

  # def new
  #   @group = Group.new
  # end

  def create
  	# @group = Group.new(group_params)
   #  respond_to do |format|
   #    if @group.save
   #      format.html { redirect_to @group, notice: "User was successfully created." }
   #    else
   #      format.html { render :new }
   #    end
   #  end
  end

  def group_params
    params.require(:group).permit(:name)
  end
end


