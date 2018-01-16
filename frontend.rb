require 'unirest'
require 'pp'

base_url = "http://localhost:3000/v2"
while true
  system "clear"

  p "Welcome to my cookbook"
  p "choose an option"
  p "[1] see all the recipes"
  p "[1.1] Search recipes"
  p "[2] see a particular recipe"
  p "[3] make a new recipe"
  p "[4] edit new recipe"
  p "[5] Destroy a recipe"
  p "[6] Sign up"
  p "[7] Log in"
  p "[8] Log out"
  p "exit"


  user_input = gets.chomp

  "localhost:300/products/3"


  if user_input == '1'
    # show all the recipes
    response = Unirest.get("#{base_url}/recipes")
    pp response.body
  elsif user_input == '1.1'
    # ask the user for some input
    p "What would you like to search for?"
    search_input = gets.chomp
    # send that input in the params hash in a Unirest call
    response = Unirest.get("http://localhost:3000/v2/recipes", parameters: {search_term: search_input})
    pp response.body
  elsif user_input == '2'
    # get a particular recipe
    # get user input for the recipe id
    p "enter the id for the item you would like to look at"
    recipe_id = gets.chomp
    # make a unirest call to get that item
    response = Unirest.get("#{base_url}/recipes/#{recipe_id}")
    pp response.body
  elsif user_input == '3'
    the_params = {}
    p "let's make a new recipe!!!"
    # make a new recipe in the db
    # ask for some user input
    p "tell me what the title is"
    the_params['title'] = gets.chomp
    p "tell me what the chef's name is"
    the_params['chef'] = gets.chomp
    p "tell me what the ingredients are"
    the_params['ingredients'] = gets.chomp
    p "tell me what the prep time is"
    the_params['prep_time'] = gets.chomp.to_i
    p "tell me what the image is"
    the_params['image'] = gets.chomp
    p "tell me what the directions is"
    the_params['directions'] = gets.chomp
    # take that user input and save it as a new recipe
    response = Unirest.post("#{base_url}/recipes", parameters: the_params)
    pp response.body
  elsif user_input == '4'
    the_params = {}
    p "let's modify a recipe!!!"
    p "hey user which recipe would you like to update?"
    recipe_id = gets.chomp
    # before the user modifies the recipe, show them the actual recipe and attributes
    response = Unirest.get("#{base_url}/recipes/#{recipe_id}")
    recipe = response.body
    pp recipe
    # make a new recipe in the db
    # ask for some user input
      p "tell me what the title is. It is currently #{recipe['title']}"
    the_params['title'] = gets.chomp
    p "tell me what the chef's name is. It is currently #{recipe['chef']}"
    the_params['chef'] = gets.chomp
    p "tell me what the ingredients are.  It is currently #{recipe['ingredients']}"
    the_params['ingredients'] = gets.chomp
    p "tell me what the prep time is  It is currently #{recipe['prep_time']}"
    the_params['prep_time'] = gets.chomp
    p "tell me what the directions is  It is currently #{recipe['directions']}"
    the_params['directions'] = gets.chomp
    p "tell me what the image is  It is currently #{recipe['image']}"
    the_params['image'] = gets.chomp
    # if one of the values is an empty string, delete it
    the_params.delete_if {|key, value| value.empty?}
    # which recipe should I update?
    response = Unirest.patch("#{base_url}/recipes/#{recipe_id}", parameters: the_params)
    pp response.body
  elsif user_input == '5'
    # ask the user which recipe they want to delete
    p "which recipe would you like to delete"
    recipe_id = gets.chomp
    # delete that recipe
    # make an http request to my API
    response = Unirest.delete("#{base_url}/recipes/#{recipe_id}")

    pp response.body
  elsif user_input == '6'
    # get user data
    the_params = {}
    p "enter your username"
    the_params['name'] = gets.chomp
    p "enter your email"
    the_params['email'] = gets.chomp
    p "enter your password"
    the_params['password'] = gets.chomp
    p "please confirm your password"
    the_params['password_confirmation'] = gets.chomp

    response = Unirest.post("localhost:3000/v2/users", parameters: the_params)
    pp response.body

    # make a post request to '/users'
    #  print out the response
  elsif user_input == '7'
    # login
    p "type in your email"
    user_email = gets.chomp
    p "type in your password"
    user_password = gets.chomp
    response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: user_email,
        password: user_password
      }
    }
  )

    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    pp response.body
  elsif user_input == '8'
    jwt = ""
    Unirest.clear_default_headers()
    p "You logged out"
  elsif user_input == 'exit'
    break
  end



end


# p response.body
