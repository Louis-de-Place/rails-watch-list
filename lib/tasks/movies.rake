namespace :movies do
  desc "Fetch and cache movies from the API"
  task fetch_and_cache: :environment do
    Movie.fetch_and_cache_movies('popular', 5)
    Movie.fetch_and_cache_movies('top_rated', 5)
    Movie.fetch_and_cache_movies('upcoming', 5)
    Movie.fetch_and_cache_movies('now_playing', 5)
  end
end
