Rails.application.routes.draw do
  root to: "airplanes#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :airplanes do
    resources :bookings, only: %i[create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get 'search', to: 'airplanes#search'
  get 'dashboard', to: 'pages#dashboard'
end
