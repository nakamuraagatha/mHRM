Rails.application.routes.draw do

  get 'settings/edit'
  get 'home/index'
  root to: "home#index"
  get 'home/all_informations', as: 'all_informations'

  devise_for :users, :controllers => { omniauth_callbacks: 'callbacks' }

  # Routes For Normal users
  resources :core_demographics, only: [:show]
  resources :departments do
    resources :department_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :contacts do
    resources :contact_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :affiliations do
    resources :affiliation_extend_demographies,  only: [:create, :update], controller: :extend_demographies
  end
  resources :organizations do
    resources :organization_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end

  resources :other_skills
  resources :clearances
  resources :certifications
  resources :educations
  resources :languages
  resources :positions
  resources :tasks do
    member do
      post 'new_note'
      get 'add_note'
    end
  end
  resources :documents


  resources :surveys do
    member do
      post   'answer'
      get    'edit_answer'
      post   'edit_answer'
      delete 'delete_answer'
    end
  end


  # Routes For Admin
  resources :checklist_templates, controller: :checklists do
    member do
      match 'save', via: [:patch, :put, :post]
    end
  end
  resources :users, only: [:index, :show, :destroy] do
    member do
      put 'change_password'
      put 'change_basic_info'
      post 'image_upload'
      get 'remove_image'
    end

    resources :core_demographics, only: [:create, :update]
    resources :job_details, only: [:create, :update]
    resources :user_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end

  resources :employees, except: [:edit] do
    member do
      get 'log_in'
    end

    get 'home/index', as: 'home'
    resources :educations
    resources :tasks
    resources :languages
    resources :positions
    resources :other_skills
    resources :clearances
    resources :certifications
    resources :departments do
      resources :department_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :contacts do
      resources :contact_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :affiliations do
      resources :affiliation_extend_demographies,  only: [:create, :update], controller: :extend_demographies
    end
    resources :organizations do
      resources :organization_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :documents
  end

  resources :enumerations
  resources :roles
  resources :settings, only: [:index, :create] do
    collection do
      post 'set_modules'
    end
  end
end
