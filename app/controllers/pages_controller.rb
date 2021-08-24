class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    redirect_to haircuts_path
  end

  def dashboard
    @haircuts = current_user.haircuts
    @bookings = current_user.bookings
  end
end
