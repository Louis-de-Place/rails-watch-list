Rails.application.routes.draw do
  get root to: 'lists#index'
  resources :lists, only: %i[show new create destroy] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
end
