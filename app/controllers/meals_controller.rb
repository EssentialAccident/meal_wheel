class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meal = Meal.new
    @meals = Meal.all.order(:name)
  end

  def show; end

  def new
    @meal = Meal.new
    @meal.days.build
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to @meal
    else
      render :new
    end
  end

  def edit; end

  def update
    if @meal.update(meal_params)
      redirect_to meals_path
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_url
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, steps_attributes: %i[id step meal_id])
  end

  def get_steps
    @steps = steps
  end
end
