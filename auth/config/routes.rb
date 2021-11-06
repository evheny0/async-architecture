Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: { registrations: "registrations" }

  root "accounts#index"
  resources :accounts do
    get :current, on: :collection
  end
end
