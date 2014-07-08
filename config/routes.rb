Rails.application.routes.draw do
  root to: "league#index"
  devise_for :users
  devise_for :installs

  resources :leagues, shallow: true do
    resources :teams
    resources :players
    resources :games
  end
end
