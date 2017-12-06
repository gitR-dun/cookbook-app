Rails.application.routes.draw do
  namespace :v1 do
    get "/the_recipe" => 'recipes#show_recipe'
  end

  namespace :v2 do
    # shows all the recipes
    get '/recipes' => 'recipes#index'
  end
end
