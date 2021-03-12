class Bookmark < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event_id, uniqueness: { scope: :user }
end
