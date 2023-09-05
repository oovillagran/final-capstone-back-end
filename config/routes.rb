Rails.application.routes.draw do
  # Mount Rswag UI and Rswag API engines
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Resourceful route for creating users
  resource :users, only: [:create]
  # Route for user authentication
  post "/login", to: "auth#login"
  # Route for auto login
  get "/auto_login", to: "auth#auto_login"
  # Route to check if user is authenticated
  get "/user_is_authed", to: "auth#user_is_authed"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy] do
        resources :reservations, only: [:index, :show, :create, :update, :destroy]
      end

      resources :doctors, only: [:index, :show, :new, :create, :destroy, :update]

      resources :specialties

      resources :clinics
    end
  end
end