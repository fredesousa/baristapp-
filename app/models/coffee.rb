# app/models/coffee.rb
class Coffee < ApplicationRecord
  # Associations
  has_many :preferences
  has_many :favorites
  has_many :reviews
  has_one_attached :photo

  MACHINS_TYPE = ['Espresso', 'Filtre', 'Chemex', 'Cafetière', 'Machine à grain'].freeze
  COFFEES_TYPE = ['Arabica', 'Robusta'].freeze

  # Validations
  validates :name, presence: true
  validates :origin, presence: true
  validates :roaster, presence: true
  validates :strength, presence: true
  validates :coffee_type, presence: true
  validates :machine_type, presence: true
  validates :machin_type, presence: true
  validates :strength, inclusion: { in: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'] }
  validates :machin_type, inclusion: { in: MACHINS_TYPE }
  validates :coffee_type, inclusion: { in: COFFEES_TYPE }
end
