Rails.application.routes.draw do
  get 'homepage/index'
  root 'homepage#index'

  # get "coaches/:id", to: 'homepage/index'
  get 'coaches/:id', to: redirect('/')


  namespace :api do
    namespace :v1 do
      resources :coaches, only: [:index, :show] do
        resources :availabilities, only: [:index]
      end
      resources :bookings, only: [:create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
