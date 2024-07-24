# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Niveaux disponibles
  LEVELS = ['Débutant', 'Intermédiaire', 'Avancé'].freeze

  # Associations
  has_many :preferences
  has_many :favorites
  has_many :likes, dependent: :destroy
  has_many :coffees, through: :preferences
  has_many :coffees, through: :favorites
  has_one_attached :photo, dependent: :destroy
  has_one :cart, dependent: :destroy
  after_create :initialize_cart
  # Enum pour le niveau
  enum level: {
    debutant: 'Débutant',
    intermediaire: 'Intermédiaire',
    avance: 'Avancé'
  }

  # Validations
  validates :level, presence: true, inclusion: { in: levels.keys }
  validates :habit, presence: true
  validates :user_name, presence: true, uniqueness: true

  private

  def initialize_cart
    self.create_cart if self.cart.nil?
  end

end
