class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    redirect_to haircuts_path
  end

  def seller
    @haircuts = current_user.haircuts
    @bookings = Booking.includes(haircut: [:user]).where(haircut: { user: current_user })
  end

  def buyer
    @bookings = current_user.bookings
  end
end
