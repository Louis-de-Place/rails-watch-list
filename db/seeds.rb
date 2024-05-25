require 'uri'
require 'net/http'
require 'json'

# Seed actors
actors_url = URI('https://api.themoviedb.org/3/person/popular')

http = Net::HTTP.new(actors_url.host, actors_url.port)
http.use_ssl = true

actors_request = Net::HTTP::Get.new(actors_url)
actors_request['accept'] = 'application/json'
actors_request['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDExOGMyNDM4OGJmOGM0MThkOTgyNjBjYzNlNDU0MyIsInN1YiI6IjY2NTEwMzlkZjI0N2VhMDkyZTRiNTg2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3orlRLs4wkSoqcImA3djlHBfySh-SXHubHMU1gMMBEk'

actors = JSON.parse(http.request(actors_request).read_body)['results']
actors.each do |actor|
  Actor.create!(name: actor['name'],
                profile_url: actor['profile_path'])
end

# Seed series
series_url = URI('https://api.themoviedb.org/3/tv/top_rated')

http = Net::HTTP.new(series_url.host, series_url.port)
http.use_ssl = true

series_request = Net::HTTP::Get.new(series_url)
series_request['accept'] = 'application/json'
series_request['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDExOGMyNDM4OGJmOGM0MThkOTgyNjBjYzNlNDU0MyIsInN1YiI6IjY2NTEwMzlkZjI0N2VhMDkyZTRiNTg2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3orlRLs4wkSoqcImA3djlHBfySh-SXHubHMU1gMMBEk'

series = JSON.parse(http.request(series_request).read_body)['results']
series.each do |serie|
  TvSerie.create!(name: serie['name'],
                overview: serie['overview'],
                poster_url: serie['poster_path'],
                rating: serie['vote_average'])
end
