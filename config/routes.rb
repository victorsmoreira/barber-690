Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: 'pages#dashboard'

  resources :haircuts do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show edit update destroy]
end
