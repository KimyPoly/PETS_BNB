class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many  :reviews, through: :bookings
  validates :name, presence: true
  validates :age, presence: true
  validates :species, presence: true
  validates :description, presence: true
  validates :habitat, inclusion: { in: ["Jungle", "Forêt", "Desert", "Ocean", "Savane"] }
end
