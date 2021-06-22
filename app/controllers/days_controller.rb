class DaysController < ApplicationController
  before_action :get_week
  before_action :set_day, only: %i[show edit update destroy]

  def index
    @days = @week.days
  end

  def show; end

  def new
    @day = @shark.days.build
  end

  def create
    @day = @week.days.build(day_params)
    if @day.save
      redirect_to week_days_path(@week)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @day.update(day_params)
      redirect_to week_day_path(@week)
    else
      render :edit
    end
  end

  def destroy
    @day.destroy
    redirect_to week_days_path(@week)
  end

  private

  def get_week
    @week = Week.find(params[:week_id])
  end

  def set_day
    @day = @week.posts.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:week_id, :meal_id)
  end
end
