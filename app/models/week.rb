class Week < ApplicationRecord
  # Relationships
  has_many :days, dependent: :destroy

  # Validations
  validates :start_date, presence: true
end
