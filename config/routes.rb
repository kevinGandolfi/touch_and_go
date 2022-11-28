Rails.application.routes.draw do
  root to: "airplanes#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :airplanes, only: %i[index new create]
  # Defines the root path route ("/")
  # root "articles#index"
end
