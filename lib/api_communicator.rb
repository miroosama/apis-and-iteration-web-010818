require 'rest-client'
require 'json'
require 'pry'

def get_characters(n)
  all_characters = RestClient.get("http://www.swapi.co/api/people/?page=#{n}")
  characters_hash = JSON.parse(all_characters)
end

def find_character(char)
  found_char = nil
  for num in 1..9
  char_hash = get_characters(num)
  char_hash["results"].each do |person|
    if person['name'] == char
    return person
    end
  end
end
puts  "Sorry, character doesn't match"
end

def get_character_movies_from_api(character)
  found_character = find_character(character)
  character_films = found_character["films"]
end
def parse_character_movies(films_hash)
  movies_arr = []
  films_hash.map do |link|
    movie = RestClient.get("#{link}")
    movie_hash = JSON.parse(movie)
    movies_arr.push(movie_hash)
  end
  movies_arr.each do |movie|
    puts movie["title"]
  end
end
def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
