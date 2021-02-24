Rails.application.routes.draw do
  devise_for :users
  root to: 'users#home'
  
  

  # post 'events/confirmation', to: "attendances#create"

  resources :events, only: [:show, :index, :new, :create] do
  	resources :attendances, only: [:create]
  end

  get 'events/:id/confirmed', to: 'events#confirmed', as: :confirmed
  get 'events/:id/confirmation', to: "events#confirmation", as: :confirmation
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
