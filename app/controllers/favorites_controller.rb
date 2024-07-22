class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    coffee = Coffee.find(params[:coffee_id])
    current_user.favorites.create(coffee: coffee)
    redirect_to coffee_path(coffee), notice: 'Votre café a été ajoutée à vos favoris.'
  end

  def destroy
    favorite = Favorite.find(params[:id])
    coffee = favorite.coffee_id
    favorite.destroy
    redirect_to coffee_path(coffee), notice: 'Votre café a été retirée de vos favoris.'
  end
end
