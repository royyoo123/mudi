class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]
	skip_after_action :verify_authorized, only: :show
	def index
		# @events = Event.all
		@events = policy_scope(Event).order(created_at: :desc)
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
		params.require(:event).permit(:name, :time, :price, :address, :date, :description)
	end
end
