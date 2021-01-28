class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review     = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # 1. new()
    @restaurant = Restaurant.new(review_params)
    # binding.pry
    # 2. if save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    # 2b.   redirect to show
    # 2c. else
    # =>  render :new
    # end
  end

  private

  def review_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
