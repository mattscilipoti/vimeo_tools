Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/overview', to: 'overview#index'
  root 'sessions#new'

  get "up" => "rails/health#show", as: :rails_health_check
end
