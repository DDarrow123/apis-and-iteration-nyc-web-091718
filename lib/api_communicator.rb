require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # Get all the Star Wars characters
  characters = response_hash["results"]
  # Go through all of Star Wars characters[]
  character_films = []
  characters.each do |star_character|
    # If star_character is equal to our user's character
    if star_character["name"].downcase == character
      # Assign character_films array to the matching
      # character's array of films.
      character_films = star_character["films"]
      break
    end
  end
  films_hash = []
    character_films.each do |url|
      response_string = RestClient.get(url)
      response_hash = JSON.parse(response_string)
      films_hash << response_hash

    end
    films_hash



  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(films_array)
  films_array.each do |film|
    puts film["title"]
  end

  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
