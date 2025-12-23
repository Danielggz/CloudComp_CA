Rails.application.routes.draw do
  # Custom route for search in API
  get "movies/search_api", to: "movies#search_api", as: :movies_search_api
  get "movies/moviePicker", to: "movies#moviePicker", as: :movies_movie_picker

  resources :movies

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
