class Meal < ApplicationRecord
  # Relationships
  has_many :days

  # Validations
  validates :name, presence: true
end
