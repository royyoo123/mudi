class Mood < ApplicationRecord
	has_many :event_moods
	has_many :events, through: :event_moods
end
