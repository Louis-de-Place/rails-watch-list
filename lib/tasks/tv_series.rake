namespace :tv_series do
  desc "Fetch and cache tv_series from the API"
  task fetch_and_cache: :environment do
    TvSerie.fetch_and_cache_tv_series('airing_today', 5)
    TvSerie.fetch_and_cache_tv_series('on_the_air', 5)
    TvSerie.fetch_and_cache_tv_series('popular', 5)
    TvSerie.fetch_and_cache_tv_series('top_rated', 5)
  end
end
