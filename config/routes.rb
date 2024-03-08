Rails.application.routes.draw do
  root "movies#index"
  resources :director_movies
  resources :actor_movies
  resources :city_movies
  resources :cities
  resources :countries
  resources :reviews do
    collection { post :import_csv }
  end
  resources :movies do
    resources :reviews
    collection { post :import_csv }
  end  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
