class SupplierController < ApplicationController
  def index
    @supplier = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new supplier_params
    if @supplier.save
      # flash[:success] = t ".flash"
      redirect_to @supplier
    else
      render :new
    end
  end

  def show
    @supplier = Supplier.find_by id: params[:id]
    return if @supplier
    # flash[:success] = t :not_flash
    redirect_to new_supplier_path
  end

  def edit; end

  private

  def supplier_params
    params.require(:supplier).permit :name, :email
  end
end
