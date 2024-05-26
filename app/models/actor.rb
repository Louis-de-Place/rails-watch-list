require 'net/http'
require 'json'

class Actor < ApplicationRecord
  validates :tmdb_id, uniqueness: true

  def self.fetch_and_cache_actors(pages = 5)
    api_key = ENV['TMDB_API_KEY']

    (1..pages).each do |page|
      url = URI("https://api.themoviedb.org/3/person/popular?api_key=#{api_key}&page=#{page}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      actors_data = JSON.parse(response.body)['results']

      actors_data.each do |actor_data|
        actor = Actor.find_or_initialize_by(tmdb_id: actor_data['id'])
        actor.update(
          name: actor_data['name'],
          biography: actor_data['biography'],
          birthday: actor_data['birthday'],
          profile_path: actor_data['profile_path'],
          popularity: actor_data['popularity']
        )
      end
    end
  rescue StandardError => e
    Rails.logger.error("Error fetching #{list_type} actors: #{e.message}")
    nil
  end
end
