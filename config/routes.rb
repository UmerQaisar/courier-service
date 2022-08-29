Rails.application.routes.draw do

  devise_for :users

  resources :travel_details do
    get :my_travel_details, on: :collection
    resources :orders
  end

  root to: 'home#homepage'
  get 'homepage', to: 'home#homepage'
  # custom route for get current user orders
  # from home controller
  get :current_user_orders, to: 'home#current_user_orders'

  # Routes For API Calls
  namespace :api do
    namespace :v1 do
      resources :travel_details do
        resources :orders
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
