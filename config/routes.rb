Rails.application.routes.draw do
  get 'homepage/index'
  root 'homepage#index'

  resources :coaches, only: [:index, :show] do
    resources :availabilities, only: [:index]
  end
  resources :bookings, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
