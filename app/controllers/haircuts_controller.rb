class HaircutsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]
  before_action :set_haircut, only: %i[show]

  def index
    @haircuts = Haircut.all
  end

  def show
    set_haircut
  end

  private

  def set_haircut
    @haircut = Haircut.find(params[:id])
  end
end
