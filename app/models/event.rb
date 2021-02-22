class Event < ApplicationRecord
  belongs_to :user, through: :attendances

  has_many :attendances
end
