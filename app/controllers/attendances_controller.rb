class AttendancesController < ApplicationController
	def new
<<<<<<< HEAD

		@event = Event.find(params[:event_id])
=======
>>>>>>> d9263db294cac52adf20a948a3d9b01498b2ef5a
		@attendance = Attendance.new
	end

	def create
<<<<<<< HEAD
		@user = current_user
		@event = Event.find(params[:event_id])
		@attendance.user = @user
		@attendance.event = @event
		@attendance = Attendance.new()
		@attendance.save

	  redirect_to event_path
	end
=======
		@attendance = Attendance.new(attendance_params)
		@attendance.save

	
	end

	
>>>>>>> d9263db294cac52adf20a948a3d9b01498b2ef5a
end
