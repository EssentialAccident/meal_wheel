class Day < ApplicationRecord
  # Relationships
  belongs_to :week
  belongs_to :meal

  # Validations
  validates :meal_id, presence: true

  # Callbacks
  before_save :get_date

  def get_date
    start_date = week.start_date
    first_day_id = week.days.first.id
    self.date = start_date + id - first_day_id
  end
end
