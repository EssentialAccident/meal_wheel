class Day < ApplicationRecord
  # Relationships
  belongs_to :week
  belongs_to :meal

  # Validations
  validates :meal_id, presence: true

  # Callbacks
  before_save :set_date

  # Scope
  default_scope { order(date: :asc) }

  def set_date
    self.date = week.start_date + week.days.index(self)
  end
end
