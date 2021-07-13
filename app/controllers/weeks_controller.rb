class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]
  before_action :set_previous_monday, only: %i[index new edit]

  def index
    @weeks = Week.all.order(:start_date)
  end

  def show; end

  def new
    @week = Week.new
    @meals = Meal.alphabetical_order
    7.times { @week.days.build }
  end

  def create
    if @week.save
      redirect_to @week
    else
      render :new
    end
  end

  def edit
    @meals = Meal.alphabetical_order
  end

  def update
    if @week.update(week_params)
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

  def get_days
    @days = days
  end

  def week_params
    params.require(:week).permit(:start_date, days_attributes: %i[id meal_id date])
  end

  def set_previous_monday
    @previous_monday = previous_monday(Time.now)
  end
end
