class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meals_path
    else
      flash.alert = 'Meal could not bne created'
      redirect_to meals_path
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
