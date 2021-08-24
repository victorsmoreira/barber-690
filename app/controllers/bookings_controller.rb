class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit show destroy]

  def new
    @booking = Booking.new
    @haircut = Haircut.find(params[:haircut_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.haircut = Haircut.find(params[:haircut_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit; end

  def index
    @bookings = Booking.all
  end

  def show; end

  def destroy
    @booking.destroy
    redirect_to haircut_path(@booking.haircut)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:appointment, :rating, :price, :user_id, :haircut_id)
  end
end
