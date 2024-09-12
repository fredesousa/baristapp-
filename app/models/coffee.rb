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
# Types de machines à café les plus courants
MACHINS_TYPE = [
  'Espresso',        # Machine à espresso
  'Filtre',          # Machine à café filtre
  'Chemex',          # Filtre manuel (Chemex)
  'Cafetière à piston', # French Press
  'Machine à grain',  # Machine à café avec moulin intégré
  'Percolateur',     # Percolateur
  'Cafetière italienne', # Moka Pot
  'Syphon',          # Cafetière à siphon
  'Cafetière turque',  # Turkish Coffee (Ibrik)
  'Phin'             # Café vietnamien
].freeze

# Types de café les plus courants
COFFEES_TYPE = [
  'Arabica', 
  'Robusta',
  'Liberica',        # Une autre variété de café moins courante
  'Excelsa'          # Une variété rare, souvent classée avec Liberica
].freeze

# Origines de café les plus courantes
ORIGINS = [
  'Costa Rica',
  'Brésil',          
  'Madagascar',
  'Éthiopie',        
  'Mexique',
  'Pérou',           
  'Guatemala',
  'Colombie',        
  'Kenya',           
  'Jamaïque',        
  'Honduras',        
  'Yémen',           
  'Vietnam'          
].freeze

# Méthodes de préparation de café les plus courantes
BREWING_METHODS = [
  'French Press',    # Cafetière à piston
  'Moka Pot',        # Cafetière italienne
  'Espresso',        # Machine à espresso
  'Aeropress',       # Aeropress
  'Chemex',          # Filtre manuel
  'Drip Coffee',     # Café filtre
  'Cold Brew',       # Café infusé à froid
  'Syphon',          # Cafetière à siphon
  'Turkish Coffee',  # Cafetière turque (Ibrik)
  'Phin',            # Café vietnamien
  'Percolator'       # Percolateur
].freeze

  
  # Validations
  validates :name, presence: true
  validates :origin, inclusion: { in: ORIGINS }
  validates :brewing_method, inclusion: { in: BREWING_METHODS }
  validates :strength, presence: true
  validates :coffee_type, inclusion: { in: COFFEES_TYPE }
  validates :machin_type, inclusion: { in: MACHINS_TYPE }
  validates :strength, inclusion: { in: (1..10).to_a.map(&:to_s) }
  validates :price, presence: true, numericality: { greater_than: 0 }

end
