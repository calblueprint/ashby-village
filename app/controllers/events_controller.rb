class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  autocomplete :user, :full_name, full: true

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  def attendance
    @event = Event.find(params[:event_id])
    @events = Event.all
    @group = @event.group
    @rsvps = @event.invites.where(rsvp: true)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @post = Post.new
    @reply = Reply.new
    @event = Event.find(params[:id])
    @event_id = @event.id
    @group = @event.group
    @posts = @event.posts.where(group_id: nil)
    @group_id = nil
  end

  # GET /events/new
  def new
    if params.key?(:event_param)
      @event = Event.new(params[:event_param].permit(:title, :description, :starttime,
                                                     :startdate, :endtime, :enddate, :location))
    else
      @event = Event.new
    end
    @group = Group.friendly.find(params[:group_id])
    @users = @group.users.where.not(id: current_user.id).decorate.map { |u| [u.full_name, u.id] }
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if(not params[:gmap].nil?)
      @event.gmap = true
    end
    @group = Group.friendly.find(params[:group_id])
    @event.group = @group
    if @event.save
      @event.add_users(current_user, organizers = params[:selected_organizers].split(",").map{ |o| o.to_i })
      redirect_to group_event_path(@group, @event), notice: "Event was successfully created."
    else
      flash[:error] = @event.errors.values.first.first
      redirect_to action: "new", event_param: event_params
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Event updated!"
      redirect_to group_event_path
    else
      render :edit
      flash[:alert] = "Unable to update event."
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT Set RSVP to True
  def rsvp
    invite = Invite.where(user_id: current_user.id, event_id: params[:event_id]).first
    # TODO: check valid invite
    invite.update_attribute(:rsvp, "true")
    flash[:notice] = "You Have RSVPed!"
    redirect_to :back
  end

  # PATCH/PUT Set RSVP to False
  def cancel
    invite = Invite.where(user_id: current_user.id, event_id: params[:event_id]).first
    # TODO: check valid invite
    invite.update_attribute(:rsvp, "false")
    flash[:notice] = "Cancelled Attendance"
    redirect_to :back
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :starttime, :startdate,
                                  :endtime, :enddate, :location, :group_id, :capacity,
                                  :gmap, :repeat_weekly, :repeat_monthly)
  end
end
