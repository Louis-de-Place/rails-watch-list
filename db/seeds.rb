require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)['results']
movies.each do |movie|
  Movie.create!(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
end
