FactoryBot.define do
  factory :day do
    association :week
    meal_id { 1 }
  end
end
