class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def new
    @booking = Booking.new
    @haircut = Haircut.find(params[:haircut_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.haircut = Haircut.find(params[:haircut_id])
    @booking.price = @booking.haircut.price
    if @booking.save
      redirect_to buyer_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      @booking.haircut.user == current_user ? redirect_to(seller_path) : redirect_to(buyer_path)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    @booking.haircut.user == current_user ? redirect_to(seller_path) : redirect_to(buyer_path)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:appointment, :rating, :price, :user_id, :haircut_id)
  end
end
