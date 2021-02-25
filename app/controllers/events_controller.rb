class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :map]
	skip_after_action :verify_authorized, only: [:index, :show]
	def index
    if params[:query].present?
    	@events = Event.search_by_name_and_description(params[:query])
    else
    	@events = Event.all.order(created_at: :desc)
    end
    @events = policy_scope(@events)
    # @markers = @events.geocoded.map do |event|
    #   {
    #     lat: event.latitude,
    #     lng: event.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
    #     image_url: Cloudinary::Utils.cloudinary_url(event.photos[0].key)
    #   }
    # end
	end
	def map
		@events = Event.all
		@markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: Cloudinary::Utils.cloudinary_url(event.photos[0].key)
      }
    end
    authorize @events
	end

	def confirmation
		@event = Event.find(params[:id])
		authorize @event
	end
	def confirmed
		@event = Event.find(params[:id])
		authorize @event
	end
	def show
		@event = Event.find(params[:id])
		# authorize @event
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

	private
	def event_params
		params.require(:event).permit(:name, :time, :price, :address, :date, :description, photos: [])
	end
end
