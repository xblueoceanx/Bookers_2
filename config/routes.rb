Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:show]
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
