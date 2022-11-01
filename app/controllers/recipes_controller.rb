class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes, include: :user
  end

  def create
    recipe = @current_user.recipes.create!(recipe_params)
    render json: recipe, include: :user, status: :created
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end

end
