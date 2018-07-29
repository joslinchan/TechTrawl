Rails.application.routes.draw do
   
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  

  resources :companies 

  resources :events, only: [:index]
  resources :news, only: [:index]

  get '/', to: 'companies#index', as: 'home'

end
