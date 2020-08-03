Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  root "books#index"
  get 'top' => 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
