Rails.application.routes.draw do
  
  resources :login, only: [:new, :create]

  resources :lists
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conditions
  resources :interventions
  resources :sponsors
  resources :investigators
  resources :studies

  delete "/logout", to: "login#destroy"
  
  
end
