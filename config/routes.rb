Rails.application.routes.draw do
  devise_for :users
  root to: 'users#home'
  resources :users, only: [] do
  	resources :attendances, only: [:new, :create, :show, :index]
  end

  resources :events, only: [:show, :index, :new, :create]
  # resources :attendances, only: [:new, :create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
