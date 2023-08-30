Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"

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