class UpdateTvSeriesJob < ApplicationJob
  queue_as :default

  TV_SERIES_LIST_TYPES = %w[airing_today on_the_air popular top_rated].freeze
  PAGES = 5

  def perform
    TV_SERIES_LIST_TYPES.each do |list_type|
      TvSerie.fetch_and_cache_tv_series(list_type, PAGES)
    end
  end
end
