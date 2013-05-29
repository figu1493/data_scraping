DataScraping::Application.routes.draw do
  resources :products

  root to: 'products#home'

  match '/home',    to: 'products#home'
  match '/products',    to: 'products#index'
  match '/destroy',    to: 'products#destroy_all'
end
