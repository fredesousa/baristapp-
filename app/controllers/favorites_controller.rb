class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # Liste les favoris de l'utilisateur connecté
  def index
    @favorites = current_user.favorites.includes(:coffee)
  end

  # Ajoute un café aux favoris de l'utilisateur connecté
  def create
    @coffee = Coffee.find(params[:coffee_id])
    if current_user.favorites.exists?(coffee: @coffee)
      redirect_to coffees_path, alert: 'Ce café est déjà dans vos favoris'
    else
      current_user.favorites.create(coffee: @coffee)
      redirect_to coffees_path, notice: 'Ajouté aux favoris'
    end
  end

  # Supprime un favori de l'utilisateur connecté
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    if @favorite
      @favorite.destroy
      redirect_to coffees_path, notice: 'Supprimé des favoris'
    else
      redirect_to coffees_path, alert: 'Favori non trouvé'
    end
  end
end
