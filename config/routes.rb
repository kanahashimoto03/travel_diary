Rails.application.routes.draw do
  devise_for :users
  get 'diaries/index'
  root to: "diaries#index"
  resources :users, only: [:index, :new, :create, :destroy]
  resources :diaries, only: [:index, :new, :create,:show]
end
