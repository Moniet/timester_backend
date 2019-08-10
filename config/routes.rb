Rails.application.routes.draw do
  resources :user, only: [:create]
  post '/register', to: 'users#create'
  get '/tasks', to: 'users#tasks'
  post '/login', to: 'auth#create'
end