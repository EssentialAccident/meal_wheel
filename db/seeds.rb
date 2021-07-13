# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

puts 'Seeding meals'
meals = ['Pasta Bologna',
         'Tacos',
         'Pork Chops + Rice',
         'Lasagna',
         'Ground beef sandwhich',
         'Pork sloppy Joe',
         'Burgers',
         'Loaded potato wedges',
         'Pork sausage and rosted tomato risotto',
         'Tuscan Herbed Chicken linguini',
         'Cowboy Skillet',
         'Flatbreads',
         'Cuatro quesos',
         'Gracy smothered pork chops',
         'Lemon rosemary chicken',
         'Garlic Rosemary Chicken',
         'Crispy bruscheta chiken',
         'Bacon and rosted tomato linguini',
         'Dijon butter steak',
         'Chicken Bacon Avocado sandwhich',
         'Wedge salad nigth',
         'Ground beef sandwhich']

meals.each do |meal|
  recipes = []
  rand(1..10).times do
    recipes.append(Recipe.new({ step: FFaker::Lorem.paragraph }))
  end
  Meal.create({ name: meal, recipes: recipes })
end

puts 'Seeding weeks'
weeks = []
10.times do |n|
  date = Time.now.to_date + (n * 7)
  weeks.append(date)
end
weeks.each do |date|
  days = []
  7.times do
    days.append(Day.new({ meal_id: Meal.all.sample.id }))
  end
  Week.create({ start_date: date,
                days: days })
end
