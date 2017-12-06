class V2::RecipesController < ApplicationController
  def index
    # get all the recipes from my db
    recipes = Recipe.all
    # show the user all the recipes in my db
    render json: recipes.as_json
  end

  # def show_recipe
  #   # grab a recipe from the db
  #   the_recipe = Recipe.last

  #   # show the user that recipe
  #   render json: {
  #     title: the_recipe.title,
  #     chef: the_recipe.chef,
  #     ingredients: the_recipe.ingredients,
  #     prepTime: the_recipe.prep_time,
  #     image: the_recipe.image,
  #     directions: the_recipe.directions
  #   }
  # end
end
