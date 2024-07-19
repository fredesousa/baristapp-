class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    raise
    coffee = Coffee.find(params[:coffee_id])
    current_user.favorites_coffees << coffee
    redirect_to coffee_path(coffee), notice: 'Votre café a été ajoutée à vos favoris.'
  end

  def destroy
    coffee = Coffee.find(params[:coffee_id])
    current_user.favorites.delete(coffee)
    redirect_to coffee_path(coffee), notice: 'Votre café a été retirée de vos favoris.'
  end
end
