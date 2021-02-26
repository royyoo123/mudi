class AttendancesController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new
		authorize @attendance
	end

	def create
		@user = current_user
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new()
		@attendance.user = @user
		@attendance.event = @event
		authorize @attendance
		@attendance.save
	  redirect_to confirmed_path(@event)
	end

	def index
		@attendances = current_user.attendances.order(created_at: :desc)
		@attendances = policy_scope(@attendances)
	end
end
