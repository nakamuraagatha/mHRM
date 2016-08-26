Rails.application.routes.draw do



  devise_for :users
  resources :users, only: [:index, :show, :destroy] do
    member do
      put 'change_password'
      post 'image_upload'
      get 'remove_image'
    end
    resources :educations, only: [:show, :edit]
    resources :documents, only: [:show, :edit]
  end
  resources :core_demographics

  resources :extend_demographies
  resources :positions
  resources :departments
  resources :entended_demographics
  resources :identifications

  resources :enumerations
  resources :educations, except: [:index] do
    collection do
      get 'my'
    end
  end
  resources :documents

  resources :roles
  resources :addresses
  resources :contacts
  resources :organizations

  get 'home/index'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
