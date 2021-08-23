class HaircutsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]


  def index
    @haircuts = Haircut.all
  end

  def show
    @haircut = Haircut.find(params[:id])
  end
end
