Rails.application.routes.draw do
  resources :city_movies
  resources :cities
  resources :countries
  resources :reviews
  devise_for :users
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
