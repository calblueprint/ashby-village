class GroupsController < ApplicationController
  def index
    @groups = Group.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @groups }
    end

  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
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

