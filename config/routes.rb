Rails.application.routes.draw do
  get 'travel_diaries/index'
  root to: "travel_diaries#index"
end
