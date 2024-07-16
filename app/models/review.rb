# app/models/review.rb
class Review < ApplicationRecord
  # Associations
  belongs_to :coffee

  # Validations
  validates :description, presence: true
  validates :rating, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
