Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :spots, only: [ :index, :show] do
    resources :preferred_spots, only: [ :create ]
  end
  resources :preferred_spots, only: [ :destroy] do
  end
  resources :sessions, only: [ :index, :create, :edit, :update, :destroy ] do
    resources :reviews, only: [ :new, :create ]
  end

  get "/dashboard", to: "pages#dashboard", as: :dashboard
end
