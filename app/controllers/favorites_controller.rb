class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @coffee = Coffee.find(params[:coffee_id])
    @favorite = @coffee.favorites.create(user: current_user)
    redirect_to coffees_path, notice: 'Added to favorites'
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to coffees_path, notice: 'Removed from favorites'
  end
end
