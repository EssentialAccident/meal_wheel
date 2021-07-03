class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]
  before_action :set_previous_monday, only: %i[index new]

  def index
    @weeks = Week.all.order(:start_date)
  end

  def show; end

  def new
    @week = Week.new
    @meals = Meal.all
    7.times { @week.days.build }
  end

  # The create method of the Weeks controller will handle
  # two different logics.
  # 1. The Week canbe created randomly. This means that
  # the days of the Week will be created randomly from the
  # available meals.
  # 2. The week canbe created by hand. This means that the
  # user can select the seven meals of the week him/herself.
  # To know which option the user has chosen a hidden
  # param :random has been used. If set to true, the first
  # option has been chosen
  def create
    puts "===== #{params[:week][:random]}  ====="
    if params[:week][:random] == 'true'
      @week = Week.new(week_params_random)
      if @week.save
        @week.create_random_days
        redirect_to @week
      else
        render :new
      end
    else
      puts 'I got false'
      @week = Week.new(week_params)
      if @week.save
        @week.days.map(&:get_date)
        redirect_to @week
      else
        render :new
      end
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
    params.require(:week).permit(:start_date, days_attributes: [:meal_id])
  end

  def week_params_random
    params.require(:week).permit(:start_date)
  end

  def set_previous_monday
    @previous_monday = previous_monday(Time.now)
  end
end
