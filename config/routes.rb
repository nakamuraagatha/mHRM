Rails.application.routes.draw do
  get 'settings/edit'

  get 'home/index'
  root to: "home#index"


  devise_for :users
  resources :users, only: [:index, :show, :destroy] do
    member do
      put 'change_password'
      put 'change_basic_info'
      post 'image_upload'
      get 'remove_image'
    end
    resources :educations, only: [:show, :edit, :index]
    resources :documents, only: [:show, :edit, :index]
    resources :core_demographics, only: [:create, :update]
    resources :job_details, only: [:create, :update]
    resources :user_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :departments do
    resources :department_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end

  resources :educations
  resources :positions
  resources :contacts
  resources :organizations
  resources :documents

  resources :employees, only: [:index, :show] do
    get 'home/index', as: 'home'
    resources :educations
    resources :departments
    resources :positions
    resources :contacts
    resources :organizations
    resources :documents
  end



  resources :enumerations
  resources :roles
  resources :settings, only: [:index, :create]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
