Rails.application.routes.draw do
  resources :orders, only: %i[index create show update destroy]
  
  # get users
  get '/users', to: 'users#index'

  # Authentication
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Creating Account && staying authenticated
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
end
