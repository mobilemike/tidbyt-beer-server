Rails.application.routes.draw do
  get 'auth/index'
  post 'auth/sign_in'

  get 'secretbeer/new'
  post 'secretbeer/create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "auth#index"
end
