class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def add_coffee(coffee)
    current_item = cart_items.find_by(coffee_id: coffee.id)
    if current_item
      current_item.update(quantity: current_item.quantity + 1)
    else
      CartItem.create(coffee:, cart: self, quantity: 1)
    end
  end

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end
end
