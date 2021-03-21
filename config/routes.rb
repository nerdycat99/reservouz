Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_#index'
  get 'about', to: 'static_#about'
  get 'support', to: 'static_#support'
  get 'privacy', to: 'static_#privacy'
  get '/apple-app-site-association' => 'static#apple_app_site_association'
end
