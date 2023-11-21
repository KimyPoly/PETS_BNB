class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :pet_id, presence: true
end
