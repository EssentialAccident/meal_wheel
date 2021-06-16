FactoryBot.define do
  factory :week do
    start_date { Time.now.to_date }
  end
end
