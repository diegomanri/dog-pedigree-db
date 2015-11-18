class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in, except: :show
  before_filter :admin_only, only: :index
  layout 'authenticated'#, only: [:authenticated, :dogmenu, :eventmenu, :admin]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.paginate(page: params[:page], per_page: 15)
    @past_events = Event.past_events.paginate(page: params[:past_events], per_page: 5)
    @upcoming_events = Event.upcoming_events.paginate(page: params[:upcoming_events], per_page: 5)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    #@event = Event.new(event_params)
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "You have added a new event"
      redirect_to @event #events_path later
    else
      flash[:danger] = "The form contains errors"
      render :new
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event }
        flash[:success] = "The event was updated"
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
      format.html { redirect_to events_url }
      flash[:success] = "The event was deleted"
      format.json { head :no_content }
    end
  end

  def event_search
    @events = Event.all
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 15)
    else
      @events = Event.all.order('created_at DESC').paginate(page: params[:page], per_page: 15)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

  def correct_user
    if current_user != @event.creator
      flash[:danger] = "You don't have permission to do that."
      redirect_to access_authenticated_path
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:ename, :edate, :etime, :edescription, :estateprov, :ecity, :ezippostal,
                                    :ecountry, :time_zone, :avatar, :avatar_url, :creator_id)
    end
end
