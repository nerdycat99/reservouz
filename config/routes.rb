Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_#index'
  get 'about', to: 'static_#about'
  get 'pricing', to: 'static#pricing'
  get 'support', to: 'static_#support'
  get 'privacy', to: 'static_#privacy'
  get '/apple-app-site-association' => 'static#apple_app_site_association'

  namespace :api do
    namespace :v1 do
      resources :reservations, only: :index
      post '/reservations/confirm', to: '/api/v1/reservations#confirm'
    end
  end

  namespace :admin do
    resources :venues, only: [:show, :new, :create, :edit, :update]
    resources :policies, only: [:show, :new, :create, :edit, :update]
  end

  resources :reservations, only: [:index, :new, :create]
  resources :venues, only: [:index, :show]
end
