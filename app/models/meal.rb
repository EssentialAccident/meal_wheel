class Meal < ApplicationRecord
  # Relationships
  has_many :days

  # Validations
  validates :name, presence: true

  def self.alphabetical_order
    Meal.all.order(:name)
  end
end
