class MealsController < ApplicationController
  before_action :set_meal, onlly: %i[show edit update destroy]
  def index
    @meal = Meal.new
    @meals = Meal.all.order(:name)
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
    else
      flash.alert = 'Meal could not bne created'
    end
    redirect_to meals_path
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
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
