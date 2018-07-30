Rails.application.routes.draw do
   
  resources :users, only: [:new, :create, :destroy, :update, :edit]
  resource :session, only: [:new, :create, :destroy]
  
  resources :tags, shallow: true, only: [:destroy, :create]

  resources :companies 
  
  resources :articles, only: [:index, :create]

  resources :events, only: [:index, :create, :destroy]

  get '/', to: 'companies#index', as: 'home'
  get '/about', to: 'about#index'

  namespace :admin do
    
    resources :dashboard, only: [:index]
    get '/dashboard/organizations', to:'dashboard#organizations'
    get '/dashboard/technologies', to:'dashboard#technologies'
    get '/dashboard/users', to:'dashboard#users'
    get '/dashboard/events', to: 'dashboard#events'

  end
end
