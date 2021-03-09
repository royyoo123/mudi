class EventMood < ApplicationRecord
  belongs_to :event
  belongs_to :mood
  accepts_nested_attributes_for :event
end
