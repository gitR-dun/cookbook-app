require 'unirest'
require 'pp'

base_url = "http://localhost:3000/v2"
system "clear"

p "Welcome to my cookbook"
p "choose an option"
p "[1] see all the recipes"
p "[2] see a particular recipe"
p "[3] make a new recipe"

user_input = gets.chomp

if user_input == '1'
  # show all the recipes
  response = Unirest.get("#{base_url}/recipes")
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
  p "let's make a new recipe!!!"
  # make a new recipe in the db
  # ask for some user input
  p "tell me what the chef's name is"
  chef_name = gets.chomp
  p "tell me what the ingredients are"
  the_ingredients = gets.chomp
  p "tell me what the prep time is"
  the_prep_time = gets.chomp.to_i
  # take that user input and save it as a new recipe
  response = Unirest.post("#{base_url}/recipes?chef=#{chef_name}&ingredients=#{the_ingredients}&prep_time=#{the_prep_time}")
  pp response.body
end





# p response.body
