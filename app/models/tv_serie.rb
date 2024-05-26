require 'net/http'
require 'json'

class TvSerie < ApplicationRecord
  validates :tmdb_id, uniqueness: true

  def self.fetch_and_cache_tv_series(list_type, pages = 5)
    api_key = ENV['TMDB_API_KEY']

    (1..pages).each do |page|
      url = URI("https://api.themoviedb.org/3/tv/#{list_type}?api_key=#{api_key}&page=#{page}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      tv_series_data = JSON.parse(response.body)['results']

      tv_series_data.each do |tv_serie_data|
        tv_serie = TvSerie.find_or_initialize_by(tmdb_id: tv_serie_data['id'])
        tv_serie.update(
          name: tv_serie_data['name'],
          overview: tv_serie_data['overview'],
          first_air_date: tv_serie_data['first_air_date'],
          poster_path: tv_serie_data['poster_path'],
          vote_average: tv_serie_data['vote_average'],
          list_type:
        )
      end
    end
  rescue StandardError => e
    Rails.logger.error("Error fetching #{list_type} tv_series: #{e.message}")
    nil
  end
end
