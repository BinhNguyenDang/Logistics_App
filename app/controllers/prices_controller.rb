class PricesController < ApplicationController
  before_action :set_modes, only: [:new, :create, :edit, :update]
  before_action :find_price, only: [:edit, :update, :destroy]
  def index
    @prices = Price.all
  end
  

  def new 
    @price = Price.new 
  end

  def create 
    @price = Price.new(price_params)
    if @price.save
      flash[:notice] = "Price successfully registered" 
      return redirect_to prices_path
    end
    flash.now[:alert] = "Error registering price"
    render :new, status: :unprocessable_entity
  end

  def destroy
    if @price.destroy
      flash[:notice] = "Price deleted successfully"
      return redirect_to prices_path
    end
    flash.now[:alert] = "Error deleting price"
    render :index, status: :unprocessable_entity
  end

  def edit
    
  end

  def update
    if @price.update(price_params)
      flash[:notice] = "Price updated successfully"
      return redirect_to prices_path
    end
    flash.now[:alert] = "Error updating price"
    render :edit, status: :unprocessable_entity
  end

  private

  def price_params
    params.require(:price).permit(:min_weight, :max_weight, :price_per_km, :mode_id)
  end

  def set_modes
    @modes = Mode.all.order(:name)
  end

  def find_price
    @price = Price.find(params[:id])
  end
  
end
