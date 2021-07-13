class RecipesController < ApplicationController
  before_action :get_meal
  before_action :set_step, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @step = @meal.recipes.build
  end

  def create
    @step = @meal.recipe.build(recipe_params)
    if @recipe.save
      redirect_to meal_recipes_path(@meal)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to meal_recipe_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to meal_steps_path(@meal)
  end

  private

  def get_meal
    @meal = Meal.find(params[:meal_id])
  end

  def set_step
    @step = @meal.step.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:step, :meal_id)
  end
end
