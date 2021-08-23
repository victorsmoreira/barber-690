class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit]

  def edit; end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
