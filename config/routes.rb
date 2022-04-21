Rails.application.routes.draw do
  resources :customers
  resources :properties
  resources :order_details
  resources :orders
  resources :customer
  resources :item_categories
  resources :menus
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
