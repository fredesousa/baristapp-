# app/models/preference.rb
class Preference < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :coffee

end
