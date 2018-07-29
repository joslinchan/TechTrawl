Rails.application.routes.draw do
   
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  

  resources :companies 

  resources :articles, only: [:index]

  resources :events, only: [:index, :create]

  get '/', to: 'companies#index', as: 'home'
  get '/about', to: 'about#index'

  namespace :admin do
    
    resources :dashboard, only: [:index] 
    get '/dashboard/organizations', to:'dashboard#organizations'
    get '/dashboard/technologies', to:'dashboard#technologies'
 
  end

end
