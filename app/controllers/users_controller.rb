class UsersController < ApplicationController
	skip_before_action :authenticate_user!, only: :home
	skip_after_action :verify_authorized, only: :home
	def home
		@moods = Mood.all
	end
end
