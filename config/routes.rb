Rails.application.routes.draw do
  
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'sessions/new'
  get 'sessions/create'
  resources :users
  resources :posts
  get '/signup', to: 'sessions#new'  
  delete '/signout', to: 'sessions#delete'

  root 'sessions#new'
end
