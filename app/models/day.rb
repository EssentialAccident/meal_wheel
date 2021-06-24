class Day < ApplicationRecord
  # Relationships
  belongs_to :week
  belongs_to :meal

  # Validations
  validates :meal_id, presence: true
end
