every 1.day, at: '12:00 am' do
  runner 'UpdateMoviesJob.perform_now'
  runner 'UpdateTvSeriesJob.perform_now'
  runner 'UpdateActorsJob.perform_now'
end
