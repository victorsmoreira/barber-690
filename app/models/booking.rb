class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :haircut

  validates :appointment, :rating, :price, presence: true
end
