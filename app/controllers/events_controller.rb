class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :map]
	skip_after_action :verify_authorized, only: [:index, :show]
	before_action :find_event, only:[:edit,:update,:destroy,:confirmation,:confirmed,:show]
	def index
		render variants: [:desktop, :mobile]
		@events = Event.all.order(:created_at)
		if params[:latitude].present? && params[:longitude].present?
			latitude = params[:latitude]
	    longitude = params[:longitude]
	    coords = [latitude,longitude]
	    @events = Event.near(coords, 50)
		end
		if params[:moods].present?
			moods = params[:moods].split(",")
			@events = @events.select do |event|
				event.event_moods.any? do |mood_instance|
					moods.include?(mood_instance.mood_id.to_s)
				end
			end
		end
		if params[:query].present?
			events = Event.search_by_name_and_description(params[:query])
			arr = []
			@events.each do |event|
				arr.push(event) if events.include?(event)
			end
			@events = arr
		end
		if params[:date].present?
			date_time = params[:date].to_datetime
			events = Event.where("(start_date BETWEEN ? AND ?) OR start_date IS NULL", date_time.beginning_of_day, date_time.end_of_day) 
			arr = []
			
			@events.each do |event|
				arr.push(event) if events.include?(event)
			end
			@events = arr
		end
		if params[:prices].present?
			arr = []
			price_points = params[:prices].split('-')
			if price_points.length == 1
				events = Event.where("price_cents = ?", (price_points[0].to_i)*100)
			else
				events = Event.where("price_cents BETWEEN ? AND ?", price_points[0].to_i*100, price_points[1].to_i*100)
			end
			@events.each do |event|
				arr.push(event) if events.include?(event)
			end
			@events = arr
		end
    # @events = policy_scope(@events)
	end

	def map
		@events = Event.all
		@markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: event.photos.attached? ? Cloudinary::Utils.cloudinary_url(event.photos[0].key) : ''
      }
    end
    authorize @events
	end

	def confirmation
		authorize @event
	end
	def confirmed
	end
	def show
	end
	def new
		@event = Event.new
		authorize @event
	end
	def create
		@event = Event.new(event_params)
		event_mood = params[:event_moods_attributes]
		@event.user = current_user
		@event.event_moods.each do |mood|
			mood.event = @event
			mood.save!
		end
		# after line 70, create event mood with @event and @mood
		authorize @event
		if @event.save
			redirect_to @event, notice: 'Event was successfully created'
		else
			render :new
		end
	end
	def edit
		@event.user = current_user
	end
	def update
		@event.user = current_user
		@event.event_moods.destroy_all
		@event.update(event_params)
		
		if @event.save!
			redirect_to event_path(@event)
		else
			render :new
		end
	end
	def destroy
		@event.user = current_user
		@event.attendances.destroy_all
		@event.bookmarks.destroy_all
		@event.destroy
		redirect_to root_path
	end

	private
	def event_params
		params.require(:event).permit(:name, :start_date, :price, :address, :description, event_moods_attributes: [:mood_id], photos: [])
	end

	def find_event
		@event = Event.find(params[:id])
		authorize @event
	end

	def filter(event_instance)
		moods = params[:moods].split(",")
		event_instance.select do |event|
			event.event_moods.any? do |mood_instance|
				moods.include?(mood_instance.mood_id.to_s)
			end
		end
	end
end
