every 1.day, at: '12:00 am' do
  runner "UpdateMoviesJob.perform_now"
end
