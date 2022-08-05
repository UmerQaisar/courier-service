Rails.application.routes.draw do

  devise_for :users

  resources :travel_details do
    get :current_user_travel_details, on: :collection
    resources :orders
  end

  root to: 'home#homepage'

  get 'homepage', to: 'home#homepage'

  # custom route for get current user orders
  # from home controller
  get :current_user_orders, to: 'home#current_user_orders'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
