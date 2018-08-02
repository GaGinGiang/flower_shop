class FlowersController < ApplicationController
  def index; end

  def new
    @flower = Flower.new
  end

  def create
    @flower = Flower.new flower_params
    if @flower.save
      flash[:success] = t ".flash"
      redirect_to @flower
    else
      render :new
    end
  end

  def show
    @flower = Flower.find_by id: params[:id]
    return if @flower
    flash[:success] = t :not_flash
    redirect_to new_flower_path
  end

  def edit; end

  private

  def flower_params
    params.require(:flower).permit :name, :description, :image, :price, :discount
  end
end
