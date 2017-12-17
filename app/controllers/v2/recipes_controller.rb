class V2::RecipesController < ApplicationController
  def index
    # get all the recipes from my db
    # sort recipes by id
    # filter the recipes based on a keyword
    #  if the keyword is 'sandwich' I want to show all recipes that are sandwiches
    # how to get user input
    the_search_term = params[:search_term]
    # p the_search_term
    recipes = Recipe.order(:id => :asc).where("title LIKE ?", "%#{the_search_term}%")
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
       image: params['image'],
       user_id: current_user.id
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
