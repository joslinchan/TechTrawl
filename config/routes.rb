Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :companies 
  

  # get('/', { to: 'company#index', as: 'home' })
    get('/', { to: 'user#new', as: 'home' })
end
