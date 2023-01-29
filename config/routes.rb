Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'welcomes#index'

  get 'my_portfolio', to: 'users#my_portfolio'

  get 'search_stock', to: 'stocks#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
