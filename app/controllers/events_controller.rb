class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :map]
	skip_after_action :verify_authorized, only: [:index, :show]
	before_action :find_event, only:[:edit,:update,:destroy,:confirmation,:confirmed,:show]
	def index
		if params[:latitude].present? && params[:longitude].present?
			latitude = params[:latitude]
	    longitude = params[:longitude]
	    coords = [latitude,longitude]
	    @events = Event.near(coords, 50)
    elsif params[:query].present?
    	@events = Event.search_by_name_and_description(params[:query])
    else
    	@events = Event.all.order(created_at: :desc)
    end
    @events = policy_scope(@events)
    @new_bookmark = Bookmark.new
    @user = current_user
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
		@event.user = current_user
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
		@event.update(event_params)
		if @event.save
			redirect_to event_path(@event)
		else
			render :new
		end
	end
	def destroy
		@event.user = current_user
		@event.attendances.destroy_all
		@event.destroy
		redirect_to events_path
	end
	private
	def event_params
		params.require(:event).permit(:name, :start_date, :price, :address, :description, photos: [])
	end

	def find_event
		@event = Event.find(params[:id])
		authorize @event
	end
	# def get_ip
	# 	ip = user.last_sign_in_ip || user.current_sign_in_ip
	# 	location = Geocoder.search(ip)
	# 	country = location["country_name"]
	# 	state = location["region_name"]
	# 	city = location["city"]
	# 	zipcode = geoloc["zipcode"]
	# 	latitude = geoloc["latitude"]
	# 	longitude = geoloc["longitude"]
	# 	area_code = geoloc["area_code"]
	# 	return [latitude, longitude]
	# end

end
