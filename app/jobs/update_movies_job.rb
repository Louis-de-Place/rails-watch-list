class UpdateMoviesJob < ApplicationJob
  queue_as :default

  LIST_TYPES = %w[popular top_rated upcoming now_playing]

  def perform
    LIST_TYPES.each do |list_type|
      Movie.fetch_and_cache_movies(list_type)
    end
  end
end
