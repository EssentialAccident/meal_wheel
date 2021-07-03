class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]

  def index
    @weeks = Week.all.order(:start_date)
    @previous_monday = previous_monday(Time.now)
  end

  def show; end

  def new
    @week = Week.new
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
    if params[:week][:random]
      @week = Week.new(week_params)
      if @week.save
        @week.create_random_days
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
    params.require(:week).permit(:start_date)
  end
end
