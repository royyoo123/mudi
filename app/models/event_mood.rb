class EventMood < ApplicationRecord
  belongs_to :event
  belongs_to :mood
end
