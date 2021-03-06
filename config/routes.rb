Rails.application.routes.draw do
  devise_for :users
  resources :attendances, only: [:index, :show]
  root to: 'users#home'
  get 'events/map', to: 'events#map', as: :map
  # post 'events/confirmation', to: "attendances#create"
  resources :events do
  	resources :attendances, only: :create
  end
  resources :bookmarks, only: [:index, :show, :destroy, :create]
  get 'events/:id/confirmed', to: 'events#confirmed', as: :confirmed
  get 'events/:id/confirmation', to: "events#confirmation", as: :confirmation
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [ :index, :show, :update ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
