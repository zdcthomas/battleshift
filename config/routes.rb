Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
  root to: 'home#index'
  get '/register', to: 'register#show'
  resources :users
  get '/dashboard', to: 'dashboard#show'
end
