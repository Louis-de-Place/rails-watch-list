namespace :actors do
  desc "Fetch and cache actors from the API"
  task fetch_and_cache: :environment do
    Actor.fetch_and_cache_actors(5)
  end
end
