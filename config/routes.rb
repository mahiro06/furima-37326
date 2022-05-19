Rails.application.routes.draw do
  devise_for :users
  root to: "furima#index"
  resources :furima, only: [:index]
end
