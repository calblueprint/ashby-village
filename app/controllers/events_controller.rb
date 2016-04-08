class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /events/new
  def new
    @event = Event.new
    @group = Group.find(params[:format])
    @users = @group.users.where.not(id: current_user.id).decorate.map { |u| [u.full_name, u.id] }
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if !params[:organizers].nil?
     params[:organizers].concat([current_user.id.to_s])
    else
     params[:organizers] = [current_user.id.to_s]
    end

    if @event.save
      (@event.group.users).each do |user|
        Invite.create(event: @event, user: user, organizer: params[:organizers].include?(user.id.to_s), rsvp: (user.id == current_user.id ? true : false))
      end
      redirect_to @event, notice: "Event was successfully created."

      #Invite all users in this group using ashby_mailer
      @group = Group.find(@event.group_id) #get event's group
      @users = @group.users #get all users in that group
      # users.each do |user|
      #   @user_emails += user.email
      #email all these users through ashby_mailer
      AshbyMailer.email_invites(@users).deliver
    else
      flash[:error] = "Group Could not be created"
      render :new
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
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
                                  :endtime, :enddate, :location, :group_id)
  end
end
