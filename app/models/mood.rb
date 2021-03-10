class Mood < ApplicationRecord
	has_many :event_moods
	has_many :events, through: :event_moods

	def self.mood_values
		moods = Mood.all
		array = []
		moods.each do |mood|
			array << [mood.name, mood.id]
		end
		array
	end
end
