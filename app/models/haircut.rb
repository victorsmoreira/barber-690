class Haircut < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :style, :price, presence: true
  validates :style, uniqueness: { scope: :user }

  def avg_rating
    # calc
  end
end
