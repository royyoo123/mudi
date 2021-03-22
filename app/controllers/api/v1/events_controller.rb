class Api::V1::EventsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_event, only: [ :show, :update ]
  def index
    @events = Event.all
  end
  def show
  end
  def update
    if @event.update(event_params)
      render :show
    else
      render_error
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :address)
  end
  def set_event
    @event = Event.find(params[:id])
    authorize @event  # For Pundit
  end
  def render_error
    render json: { errors: @event.errors.full_messages },
      status: :unprocessable_entity
  end
end