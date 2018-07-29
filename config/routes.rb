Rails.application.routes.draw do
   
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  

  resources :companies 

  resources :news, only: [:index]

  resources :events, only: [:index, :create]

  get '/', to: 'companies#index', as: 'home'
  get '/about', to: 'about#index'

  namespace :admin do
    
    resources :dashboard, only: [:index]
    
  end

end
