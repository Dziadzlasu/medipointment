Rails.application.routes.draw do
  resources :patients
  resources :appointments

  root 'patients#index'
end
