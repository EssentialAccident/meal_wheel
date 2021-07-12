class MealsController < ApplicationController
  def index
    @meal = Meal.new
    @meals = Meal.all
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
    else
      flash.alert = 'Meal could not bne created'
    end
    redirect_to meals_path
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to @meal
    else
      render :edit
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
