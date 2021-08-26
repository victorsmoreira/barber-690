class HaircutsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]
  before_action :set_haircut, only: %i[edit show update destroy]

  def index
    @haircuts = Haircut.all
  end

  def new
    @haircut = Haircut.new
  end

  def create
    @haircut = Haircut.new(haircut_params)
    @haircut.user = current_user
    @haircut.save
    redirect_to seller_path
  end

  def edit; end

  def show
    @markers = [
      {
        id: @haircut.user.id,
        lat: @haircut.user.latitude,
        lng: @haircut.user.longitude
      }
    ]
  end

  def update
    if @haircut.update(haircut_params)
      redirect_to seller_path
    else
      render :edit
    end
  end

  def destroy
    @haircut.destroy
    redirect_to seller_path
  end

  private

  def set_haircut
    @haircut = Haircut.find(params[:id])
  end

  def haircut_params
    params.require(:haircut).permit(:style, :category, :price, :user_id, :image)
  end
end
