class V1::RecipesController < ApplicationController
  def show_recipe
    # grab a recipe from the db
    the_recipe = Recipe.last

    # show the user that recipe
    render json: {
      title: the_recipe.title,
      chef: the_recipe.chef,
      ingredients: the_recipe.ingredients,
      prep_time: the_recipe.prep_time,
      image: the_recipe.image,
      directions: the_recipe.directions
    }
  end
end



# namespace route
# make v1 folder
# put controller in v1 folder
# add namespace to class name
