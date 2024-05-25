require 'net/http'
require 'json'

class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :tmdb_id, uniqueness: true

  def self.fetch_and_cache_movies(list_type)
    api_key = ENV['TMDB_API_KEY']
    url = URI("https://api.themoviedb.org/3/movie/#{list_type}?api_key=#{api_key}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    movies_data = JSON.parse(response.body)['results']

    movies_data.each do |movie_data|
      movie = Movie.find_or_initialize_by(tmdb_id: movie_data['id'])
      movie.update(
        title: movie_data['title'],
        overview: movie_data['overview'],
        release_date: movie_data['release_date'],
        poster_path: movie_data['poster_path'],
        vote_average: movie_data['vote_average'],
        list_type: list_type
      )
    end
  rescue StandardError => e
    Rails.logger.error("Error fetching #{list_type} movies: #{e.message}")
    nil
  end
end
