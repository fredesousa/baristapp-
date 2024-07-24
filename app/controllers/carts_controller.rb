class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add, :checkout]

  def show

  end

  def add
    coffee = Coffee.find(params[:id])
    @cart.add_coffee(coffee)
    redirect_to cart_path
  end

  def checkout
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user: current_user)
  end
end
