class DashboardController < ApplicationController
  def index
    @meal = Meal.all.sample
  end
end
