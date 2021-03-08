class AttendancesController < ApplicationController
	before_action :find_event, only: [:new, :create]
	def new
	end
	def create
		@user = current_user
		@attendance.user = @user
		@attendance.event = @event
		@attendance.save
	  redirect_to confirmed_path(@event)
	end
	def index
		@attendances = current_user.attendances
		@attendances = policy_scope(@attendances)
	end
	private
	def find_event
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new()
		authorize @attendance
	end
end
