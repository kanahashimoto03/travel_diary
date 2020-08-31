Rails.application.routes.draw do
  devise_for :users
  get 'diaries/index'
  root to: "diaries#index"
  resources :users, only: [:index, :new, :create, :destroy, :show]
  resources :diaries do 
    resources :comments, only: :create
  end
  get 'search', to:'diaries#search'
end
