Rails.application.routes.draw do
  devise_for :users
  root to: 'users#home'
  resources :events, only: [:show, :index]
  resources :attendances, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
