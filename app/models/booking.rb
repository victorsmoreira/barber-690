class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :haircut

  validates :appointment, :price, presence: true
  #validates_inclusion_of :rating, in: (1..5)
end
