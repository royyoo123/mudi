class Event < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :attendances
  has_many :bookmarks
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true

  def bookmark_by_user(user)
    if user
      bookmarks.where(user: user).first
    else
      nil
    end
  end
end
