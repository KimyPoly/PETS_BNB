class Pet < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many  :reviews, through: :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :species, presence: true
  validates :description, presence: true
  validates :photo_url, presence: true
  validates :habitat, inclusion: { in: ["Jungle", "Forêt", "Desert", "Ocean", "Savane"] }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :species ],
    using: {
      tsearch: { prefix: true }
    }
end
