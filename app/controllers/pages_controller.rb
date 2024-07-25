class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @show_navbar = user_signed_in?
    @show_footer = user_signed_in?
  end

  def profil
    @favorites = Favorite.all
  end

  def contact
    # Logique pour la page de contact, si nécessaire
  end
end
