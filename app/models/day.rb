class Day < ApplicationRecord
  # Relationships
  belongs_to :week

  # Validations
  validates :meal_id, presence: true
end
