class UpdateMoviesJob < ApplicationJob
  queue_as :default

  MOVIES_LIST_TYPES = %w[popular top_rated upcoming now_playing].freeze
  PAGES = 5

  def perform
    MOVIES_LIST_TYPES.each do |list_type|
      Movie.fetch_and_cache_movies(list_type, PAGES)
    end
  end
end
