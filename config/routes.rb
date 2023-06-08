Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles, only: [:new, :create, :show, :edit, :update] # This creates routes for profile#edit and profile#update
  resources :category_budgets, only: [:show, :index]
  resources :budgets, only: [:new, :create, :index, :show, :edit, :update]
  resources :expenses, only: [:new, :create, :index, :show]
end
