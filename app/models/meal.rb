class Meal < ApplicationRecord
  # Validations
  validates :name, presence: true
end
