class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show destroy ]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to haircut_path(@booking.haircut)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
