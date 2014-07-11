Rails.application.routes.draw do
  root to: "leagues#index"
  devise_for :users
  devise_for :installs

  resources :leagues do
    resources :teams, only: [:index, :new, :create]
    resources :games, only: [:index, :show]
  end

  resources :teams, only: [:show, :edit, :update, :destroy] do
    resources :players, only: [:index, :show]
  end

end
