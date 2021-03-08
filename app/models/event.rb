class Event < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :attendances, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :event_moods
  has_many :moods, through: :event_moods
  geocoded_by :address
  monetize :price_cents
  has_many :orders, dependent: :destroy
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :photos, presence: true
  def bookmark_by_user(user)
    if user
      bookmarks.where(user: user).first
    else
      nil
    end
  end
end
