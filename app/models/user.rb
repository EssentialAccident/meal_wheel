class User < ApplicationRecord
  # Relationships

  # Validations
  validates :name, presence: true
end
