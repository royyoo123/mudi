class EventMoodsController < ApplicationController
	def new
		@event_mood = EventMood.new
		@event_mood.build_owner
	end

end
