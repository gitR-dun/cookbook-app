require 'unirest'

base_url = "http://localhost:3000"

response = Unirest.get("#{base_url}/v1/the_recipe")

p response.body
