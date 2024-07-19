# app/models/preference.rb
class Preference < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :coffee

  validates :coffee_form, presence: true
  validates :weekly_consumption, presence: true
  validates :coffee_type, presence: true
end
