Rails.application.routes.draw do
  devise_for :users
  get 'travel_diaries/index'
  root to: "travel_diaries#index"
  resources :users, only: [:index, :new, :create, :destroy]
end
