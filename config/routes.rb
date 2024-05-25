Rails.application.routes.draw do
  root 'movies#index'
  resources :lists, only: %i[index show new create destroy] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: %i[new create]
  end

  get 'movies/list/:list_type', to: 'movies#list', as: 'movie_list'
  get 'movies/:id', to: 'movies#show', as: 'movie'
  get '/tv_series', to: 'tv_series#index'
  get '/tv_series/:id', to: 'tv_series#show', as: :tv_serie
  resources :actors, only: %i[index show]

  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
end
