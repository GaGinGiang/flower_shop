class CategoriesController < ApplicationController
  # before_action :load_category, only: :show
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      # flash[:success] = t ".flash"
      redirect_to @category
    else
      render :new
    end
  end

  def edit; end

  def show
    @category = Category.find_by id: params[:id]
    @relates = Flower.related(@category.id)
  end

  private

  def category_params
    params.require(:category).permit :name
  end
end
