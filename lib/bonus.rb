require 'rest-client'
require 'json'
require 'pry'

def get_planets
  all_planets = RestClient.get("http://www.swapi.co/api/planets/")
  planet_hash = JSON.parse(all_planets)
end


def find_planet_diameter(planet_name)
  get_planets["results"].each do |planet_hash|
    if planet_hash["name"] == planet_name
      return planet_hash["diameter"]
end
end
end
binding.pry
