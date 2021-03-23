class UsersController < ApplicationController
	skip_before_action :authenticate_user!, only: :home
	skip_after_action :verify_authorized, only: :home
	protect_from_forgery with: :exception
  before_action :detect_device_variant
	def home
		@moods = Mood.all
	end

	private
	def detect_device_variant
    request.variant = :phone if browser.device.mobile?
  end
end
