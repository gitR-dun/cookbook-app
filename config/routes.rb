Rails.application.routes.draw do
  namespace :v1 do
    get "/the_recipe" => 'recipes#show_recipe'
  end

  namespace :v2 do
    # shows all the recipes
    get '/recipes' => 'recipes#index'
    # show action, one particular recipe, needs id wildcard to find in db
    get '/recipes/:id' => 'recipes#show'
    # create action, make a new recipe, doesn't need id wildcard because it hasn't been made yet
    post '/recipes' => 'recipes#create'
    # update an item currently in the db
    patch '/recipes/:id' => 'recipes#update'
    delete '/recipes/:id' => 'recipes#destroy'
  end
end
