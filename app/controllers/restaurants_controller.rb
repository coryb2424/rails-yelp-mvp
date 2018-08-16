class RestaurantsController < ApplicationController
  def index
    @grouped_restaurants = Restaurant.all.group_by(&:category)
  end

  def create
    @restaurant = Restaurant.new(safe_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def safe_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
