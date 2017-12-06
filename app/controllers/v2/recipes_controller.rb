class V2::RecipesController < ApplicationController
  def index
    # get all the recipes from my db
    recipes = Recipe.all
    # show the user all the recipes in my db
    render json: recipes.as_json
  end

  def show
    # go to params hash and get the id
    the_id = params['id']
    # grab a particular recipe from the db
    recipe = Recipe.find_by(id: the_id)
    # show a particular recipe
    render json: recipe.as_json
  end

  def create
    recipe = Recipe.new(
       chef: params['chef'],
       ingredients: params['ingredients'],
       title: params['title'],
       prep_time: params['prep_time'],
       directions: params['directions'],
       image: params['image']
     )
    recipe.save

    render json: recipe.as_json
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
