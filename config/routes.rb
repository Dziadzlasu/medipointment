Rails.application.routes.draw do
  resources :patients do
    member do
      get :appointments
    end
    collection do
      get :chart
    end
  end

  resources :appointments

  root 'patients#index'
end
