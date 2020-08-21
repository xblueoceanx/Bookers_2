Rails.application.routes.draw do
  devise_for :users
  get 'home/about'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
  root "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
