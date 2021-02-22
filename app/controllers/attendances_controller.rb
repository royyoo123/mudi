class AttendancesController < ApplicationController
	def new
		@attendance = Attendance.new
	end

	def create
		@attendance = Attendance.new(attendance_params)
		@attendance.save

	
	end

	
end
