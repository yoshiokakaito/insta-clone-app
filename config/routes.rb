Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/microposts' => 'microposts#new'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :microposts do
    resources :comments, only: [:create,:destroy]
  end
  resources :notifications, only: :index
end
