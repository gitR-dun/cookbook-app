Rails.application.routes.draw do
  get "/the_recipe" => 'recipes#show_recipe'
end
