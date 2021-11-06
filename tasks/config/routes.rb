Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tasks#index"

  get "/auth/:provider/callback", to: "sessions#create"

  resources :tasks
  resources :personal_tasks, only: %i(index update)
  resource :reassign, only: %i(create)

  resource :sessions
end
