# app/models/coffee.rb
class Coffee < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  # Associations
  has_many :preferences
  has_many :favorites
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  MACHINS_TYPE = ['Espresso', 'Filtre', 'Chemex', 'Cafetière', 'Machine à grain'].freeze
  COFFEES_TYPE = ['Arabica', 'Robusta'].freeze
  ORIGINS = ['Costa Rica', 'Bresil', 'Madacascar', 'Ethiopie', 'Mexique', 'Perou', 'Guatemala'].freeze
  BREWING_METHODS = ['Aeropress', 'V60', 'Cold Brew', 'Moka Pot', 'Pour Over'].freeze
  # Validations
  validates :name, presence: true
  validates :origin, inclusion: { in: ORIGINS }
  validates :brewing_method, inclusion: { in: BREWING_METHODS }
  validates :strength, presence: true
  validates :coffee_type, inclusion: { in: COFFEES_TYPE }
  validates :machin_type, inclusion: { in: MACHINS_TYPE }
  validates :strength, inclusion: { in: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'] }

end
