Rails.application.routes.draw do
  resources :user, only: [:create]
  post '/register', to: 'users#create'
  post '/login', to: 'auth#create'
end