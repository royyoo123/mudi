class Event < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :attendances
end
