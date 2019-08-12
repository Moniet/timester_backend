Rails.application.routes.draw do
  resources :tasks, only: [:create, :update]
  post '/register', to: 'users#create'
  get '/tasks', to: 'users#tasks'
  post '/login', to: 'auth#create'
end