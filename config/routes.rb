Rails.application.routes.draw do
  get 'user/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/home/load', to: 'home#load'
  get '/sportsmans/load', to: 'sportsmans#load'
  resources :roles
  resources :users do	
  	member do
        get :new_sportsman, :edit_sportsman
        post :create_sportsman
      end
  end    
  resources :sportsmans
  resources :sports
  resources :competitions
  match '/signup',  to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  resources :sessions, only: [:new, :create, :destroy]
end
