Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :studies
  resources :conditions
  resources :interventions
  resources :investigators
  resources :sponsors

end
