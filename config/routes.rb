Rails.application.routes.draw do
  resource :users, only: [:create, :destroy]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :new, :create, :destroy] do
        resources :reservations, only: [:index, :show, :new, :create, :update, :destroy]
      end

      resources :doctors, only: [:index, :show, :new, :create, :destroy, :update]

      resources :specialties

      resources :clinics
    end
  end
end