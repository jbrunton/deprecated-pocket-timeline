class EventsController < ApplicationController
  before_action :set_event, only: [:show, :add, :edit, :update, :destroy]
  before_action :set_timeline, only: [:search, :add, :new, :create, :index]

  # GET /events
  # GET /events.json
  def index
    @events = if @timeline.nil? then Event.all else @timeline.events end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/search
  # GET /timelines/1/events/search
  def search
    if params[:query]
      search_query = "%#{params[:query].downcase}%"
      @events = Event.where("lower(title) LIKE :query or lower(description) LIKE :query", :query => search_query)
    end

    respond_to do |format|
      format.html
      format.json { render 'events/index' }
    end
  end
  
  # POST /timelines/1/events/1/add
  def add
    @timeline.events.push @event
    respond_to do |format|
      format.html { redirect_to @timeline, notice: 'Event was added to timeline.' }
    end
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
    respond_to do |format|
      build_event
      if save_event_and_timeline
        format.html { redirect_to_event_or_timeline }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    
    def set_timeline
      @timeline = Timeline.find(params[:timeline_id]) unless params[:timeline_id].nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :title, :description)
    end
    
    def build_event
      if @timeline
        @event = @timeline.events.build(event_params)
      else
        @event = Event.new(event_params)
      end
    end
    
    def save_event_and_timeline
      (@timeline ? @timeline.save : true) && @event.save
    end
    
    def redirect_to_event_or_timeline
      resource = @timeline ? @timeline : @event
      redirect_to resource, notice: 'Event was successfully created.'
    end
end
