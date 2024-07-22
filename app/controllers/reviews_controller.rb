class ReviewsController < ApplicationController
  before_action :set_coffee, only: [:destroy, :create]

  def create
    @review = Review.new(review_params)
    @review.coffee = @coffee
    @review.save!
    redirect_to coffee_path(@coffee)
  end

  def destroy
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:coffee_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
