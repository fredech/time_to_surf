Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :spots, only: [ :index, :show] do
    resources :preferred_spots, only: [ :create ]
  end
  resources :preferred_spots, only: [ :destroy] do
  end
  resources :surf_sessions, only: [ :index, :create, :edit, :update, :destroy ] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :profile, only: [ :create, :edit, :update]

  get "/dashboard", to: "pages#dashboard", as: :dashboard
end
