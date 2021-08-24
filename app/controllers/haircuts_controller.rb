class HaircutsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index show]
  before_action :set_haircut, only: %i[edit show update destroy]

  def new
    @haircut = Haircut.new
  end

  def create
    @haircut = Haircut.new(haircut_params)
    @haircut.save
    redirect_to haircut_path(@haircut)
  end

  def edit; end

  def index
    @haircuts = Haircut.all
  end

  def show; end

  def update
    if @haircut.update(haircut_params)
      redirect_to @haircut
    else
      render :edit
    end
  end

  def destroy
    @haircut.destroy
    redirect_to haircuts_path
  end

  private

  def set_haircut
    @haircut = Haircut.find(params[:id])
  end

  def haircut_params
    params.require(:haircut).permit(:style, :category, :price, :user_id)
  end
end
