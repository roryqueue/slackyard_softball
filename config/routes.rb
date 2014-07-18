Rails.application.routes.draw do
  root to: "leagues#index"
  devise_for :users
  devise_for :installs

  resources :leagues do
    resources :teams, only: [:new, :create]
    resources :games, only: [:index, :show]
  end

  resources :teams, only: [:show, :edit, :update, :destroy] do
    resources :players, only: [:show, :new, :create]
    resources :lineups, only: [:new, :create]
  end

  resources :contacts, only: :index
  resources :lineups, only: [:edit, :update, :destroy]
end
