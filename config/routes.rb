Rails.application.routes.draw do
  get 'customer/index'
  get 'customer/show'
  get 'customer/new'
  get 'customer/edit'
  get 'item_category/index'
  get 'item_category/show'
  get 'item_category/new'
  get 'item_category/edit'
  resources :menus
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
