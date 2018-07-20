Rails.application.routes.draw do
  get 'welcome/Index'
  resources :sessions
  resources :users
  resources :braintree

  post 'braintree/checkout'
 get 'welcome/index'
  root 'welcome#index'

  resources :articles do
  	collection do
  		get :search #creates a new path for searching
  end
 end
end

