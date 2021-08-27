class Haircut < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image

  validates :style, :price, presence: true
  validates :style, uniqueness: { scope: :user }

  def avg_rating
    ratings = bookings.map(&:rating).compact
    ratings.any? ? (ratings.reduce(:+) / ratings.size.to_f).round(1) : '-'
  end

  def distance_to(customer)
    barbier_coord = [user.latitude, user.longitude]
    user_coord = [customer.latitude, customer.longitude]
    Geocoder::Calculations.distance_between(barbier_coord, user_coord).round(2)
  end
end
