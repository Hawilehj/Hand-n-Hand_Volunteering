Rails.application.routes.draw do


  # resources
  resources :jobs
  resources :locations
  resources :organizations
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :jobs, only: [:create, :destroy]

  # Root
  root 'volunteer#index'

  # static pages
  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get   '/locations', to: 'static_pages#locations'

  # Job types
  get '/school', to: 'jobs#school'
  get '/hospital', to: 'jobs#hospital'
  get '/animal', to: 'jobs#animal_shelter'
  get '/church', to: 'jobs#church'

  # user login sessions
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # connected organizations
  get 'org_sessions/new'
  get '/signin', to: 'org_sessions#new'
  post '/signin', to: 'org_sessions#create'
  delete 'signout', to: 'org_sessions#destroy'



  # user password reset
  get 'password_resets/new'
  get 'password_resets/edit'

  # user sign up
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # misc
  get 'users/new'
  get '/neworg', to: 'organizations#new'
  get '/home', to: 'users#home'

  get '/show', to: 'locations#index'
  get '/newjob', to: 'jobs#new'
  get '/test', to: 'volunteer#login'
  get'/org', to: 'organizations#index'
  get '/addlocation', to: 'locations#new'



end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
