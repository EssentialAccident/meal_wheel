class Day < ApplicationRecord
  # Relationships
  belongs_to :week
  has_one :meal

  # Validations
  validates :meal_id, presence: true
end
