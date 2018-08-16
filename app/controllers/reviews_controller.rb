class ReviewsController < ApplicationController
  before_action :retrieve_restaurant

  def create
    @review = Review.new(safe_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @review = Review.new
  end

  private

  def retrieve_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def safe_params
    params.require(:review).permit(:content, :rating)
  end
end
