# app/models/coffee.rb
class Coffee < ApplicationRecord
  # Associations
  has_many :preferences
  has_many :favorites
  has_many :reviews
  has_one_attached :photo

  # Validations
  validates :name, presence: true
  validates :origin, presence: true
  validates :roaster, presence: true
  validates :strength, presence: true
  validates :coffee_type, presence: true
  validates :machine_type, presence: true

end
