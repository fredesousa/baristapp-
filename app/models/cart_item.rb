class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :coffee

  validates :quantity, numericality: { greater_than: 0 }

  # Calculer le prix total pour cet item
  def total_price
    coffee.price * quantity
  end
end
