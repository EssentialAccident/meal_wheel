class Recipe < ApplicationRecord
  # Relationships
  belongs_to :meal

  # Validations
  validates :step, presence: true
end
