Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :haircuts, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show edit update destroy]
end

# /barber/haircuts
# /barber/haircuts/:haircut_id/bookings/
# /barber/haircuts/:haircut_id/bookings/:id
# /barber/haircuts/new
# /barber/haircuts
# /barber/haircuts/:id/edit
# /barber/haircuts/:id/
# /barber/haircuts/:id/
