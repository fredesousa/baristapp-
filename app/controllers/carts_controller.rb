class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add, :remove, :update, :checkout]

  def show
    # Afficher les produits dans le panier
  end

  def add
    coffee = Coffee.find(params[:id])
  @cart.add_coffee(coffee)
  redirect_to cart_path
  end

  # Supprimer un produit du panier
  def remove
    item = @cart.cart_items.find(params[:id])
    @cart.cart_items.destroy(item)
    redirect_to cart_path, notice: "#{item.coffee.name} a été retiré du panier."
  end

  # Mettre à jour la quantité d'un produit dans le panier
  def update
    item = @cart.cart_items.find(params[:id])
    new_quantity = params[:quantity].to_i
    if new_quantity > 0
      item.update(quantity: new_quantity)
      redirect_to cart_path, notice: "La quantité de #{item.coffee.name} a été mise à jour."
    else
      redirect_to cart_path, alert: "La quantité doit être supérieure à zéro."
    end
  end

  def checkout
    # Logique de paiement
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user: current_user)
  end
end
