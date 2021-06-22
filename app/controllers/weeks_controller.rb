class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]

  def index
    @weeks = Week.all
  end

  def show; end

  def new
    @week = Week.new
  end

  def create
    @week = Week.new(week_params)
    if @week.save
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

  def day_params
    params.require(:week).permit(:start_date)
  end
end
