class Week < ApplicationRecord
  # Relationships
  has_many :days, dependent: :destroy

  # Validations
  validates :start_date, presence: true

  def create_random_days
    days = []
    meals = Meal.all
    7.times do |n|
      days.append({ date: start_date + n, week_id: id, meal_id: meals.sample.id })
    end
    Day.create(days)
  end
end
