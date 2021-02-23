class AttendancesController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new
	end

	def create
		@user = current_user
		@event = Event.find(params[:event_id])
		@attendance.user = @user
		@attendance.event = @event
		@attendance = Attendance.new()
		@attendance.save

	  redirect_to event_path
	end
		@attendance = Attendance.new(attendance_params)
		@attendance.save
	end
end
