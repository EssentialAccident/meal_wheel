class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]

  def index
    @weeks = Week.all.order(:start_date)
    @previous_monday = previous_monday(Time.now)
  end

  def show; end

  def create
    @week = Week.new(week_params)
    if @week.save
      create_days(@week)
      redirect_to @week
    else
      render :new
    end
  end

  def edit; end

  def update
    if @week.update
      redirect_to @week
    else
      render :edit
    end
  end

  def destroy
    @week.destroy
    redirect_to weeks_url
  end

  private

  def set_week
    @week = Week.find(params[:id])
  end

  def get_days; end

  def week_params
    params.require(:week).permit(:start_date)
  end

  def create_days(week)
    days = []
    meals = Meal.all
    7.times do |n|
      days.append({ date: week.start_date + n, week_id: week.id, meal_id: meals.sample.id })
    end
    Day.create(days)
  end
end
