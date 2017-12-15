Rails.application.routes.draw do
  namespace :v1 do
    get "/the_recipe" => 'recipes#show_recipe'
  end

  namespace :v2 do
    get '/recipes' => 'recipes#index'
    get '/recipes/:id' => 'recipes#show'
    post '/recipes' => 'recipes#create'
    patch '/recipes/:id' => 'recipes#update'
    delete '/recipes/:id' => 'recipes#destroy'

    post '/users' => 'users#create'
  end
end
