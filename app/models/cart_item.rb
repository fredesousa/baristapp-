class CartItem < ApplicationRecord
  belongs_to :coffee
  belongs_to :cart

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_price
    coffee.price * quantity
  end
end
