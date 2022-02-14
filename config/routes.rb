Rails.application.routes.draw do
  resources :users
  # resources :users, only: [:new, :create etc] to leave out unwanted paths
  resources :posts
  
  # get '/destroy/post', to: 'posts#destroy'
  # delete '/destroy/post', to: 'posts#destroy'
  
  post '/show', to: 'posts#show'
  
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  
  root "posts#index"
end
