# app/models/review.rb
class Review < ApplicationRecord
  # Associations
  belongs_to :coffee
  has_many :likes, dependent: :destroy

  # Validations
  validates :description, presence: true
  validates :rating, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def liked_by?(user)
    likes.exists?(user: user)
  end
end
