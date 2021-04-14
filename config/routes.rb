Rails.application.routes.draw do
  resources :categories
  resources :warehouses do
    resources :products
    member do
      get :accept, to: 'warehouses#acceptance_form'
      get :dispose, to: 'warehouses#disposal_form'
      post :accept
      post :dispose
    end
  end
end