class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ destroy ]

  def destroy
    @booking.destroy
    redirect_to haircut_path(@booking.haircut)
  end
end
