class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  # Ajouter un café au panier
  def add_coffee(coffee)
    current_item = cart_items.find_by(coffee_id: coffee.id)
    if current_item
      current_item.update(quantity: current_item.quantity + 1)
    else
      CartItem.create(coffee: coffee, cart: self, quantity: 1)
    end
  end

  # Retirer un café du panier
  def remove_coffee(coffee)
    current_item = cart_items.find_by(coffee_id: coffee.id)
    current_item&.destroy
  end

  # Mettre à jour la quantité d'un café dans le panier
  def update_quantity(coffee, new_quantity)
    current_item = cart_items.find_by(coffee_id: coffee.id)
    if current_item
      if new_quantity > 0
        current_item.update(quantity: new_quantity)
      else
        current_item.destroy # Supprimer l'item si la quantité est zéro ou négative
      end
    end
  end

  # Calculer le prix total du panier
  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end
end
