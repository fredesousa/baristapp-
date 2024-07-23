class ReviewsController < ApplicationController
  before_action :set_coffee, only: [:destroy, :create]

  def create
    @review = Review.new(review_params)
    @review.coffee = @coffee
    @review.user = current_user # Assigner l'utilisateur actuel à la revue
    # Inverser la valeur de la note
    @review.rating = 6 - @review.rating if @review.rating.present?
    
    if @review.save
      redirect_to coffee_path(@coffee), notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to coffee_path(@coffee), alert: 'Erreur lors de l\'ajout du commentaire.'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to coffee_path(@review.coffee), notice: 'Commentaire supprimé avec succès.'
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:coffee_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
