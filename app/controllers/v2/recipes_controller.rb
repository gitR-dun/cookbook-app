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

  def update
    # grab a recipe from the db
    the_id = params['id']
    recipe = Recipe.find_by(id: the_id)
    # actually update it
    recipe.chef = params['chef'] || recipe.chef
    recipe.ingredients = params['ingredients'] || recipe.ingredients
    recipe.prep_time = params['prep_time'] || recipe.prep_time
    recipe.directions = params['directions'] || recipe.directions
    recipe.image = params['image'] || recipe.image
    recipe.title = params['title'] || recipe.title

    recipe.save
    render json: recipe.as_json
  end

  def destroy
    # find a particular recipe in the db
    the_id = params['id']
    recipe = Recipe.find_by(id: the_id)
    # destroy it
    recipe.destroy
    render json: {message: "You deleted a recipe"}
  end
end
