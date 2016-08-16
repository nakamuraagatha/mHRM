Rails.application.routes.draw do
  resources :enumerations

  resources :educations do
    collection do
      get 'my'
    end
  end
  resources :roles
  resources :addresses
  resources :contacts
  resources :organizations
  resources :core_demographics
  devise_for :users
  get 'home/index'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
