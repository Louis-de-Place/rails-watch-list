class UpdateActorsJob < ApplicationJob
  queue_as :default

  PAGES = 5

  def perform
    Actor.fetch_and_cache_actors(list_type, PAGES)
  end
end
