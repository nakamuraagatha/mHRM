Rails.application.routes.draw do
  resources :positions
  resources :departments
  resources :entended_demographics
  resources :identifications
  resources :documents
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
  post 'image_upload', to: "core_demographics#image_upload"
  get 'remove_image', to: "core_demographics#remove_image"
  resources :core_demographics
  devise_for :users
  get 'home/index'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
