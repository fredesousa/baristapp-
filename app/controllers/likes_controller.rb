class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review

  def create
    if @review.liked_by?(current_user)
      flash[:notice] = "You already liked this review"
    else
      @review.likes.create(user: current_user)
    end
    redirect_to coffee_path(@review.coffee)
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to coffee_path(@review.coffee)
  end

  private

  def find_review
    @review = Review.find(params[:review_id])
  end
end
