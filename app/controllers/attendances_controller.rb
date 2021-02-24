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
end
