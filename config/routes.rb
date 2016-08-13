Rails.application.routes.draw do
  resources :educations
  resources :roles
  resources :addresses
  resources :contact_types
  resources :contacts
  resources :organizations
  resources :core_demographics
  devise_for :users
  get 'home/index'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
