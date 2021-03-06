class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :haircuts
  has_many :bookings
  has_one_attached :avatar
  has_one_attached :barbershop

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_name
    "#{first_name} #{last_name}"
  end
end
