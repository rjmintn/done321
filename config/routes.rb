Rails.application.routes.draw do

  resources :lists do
    resources :items
  end
  get 'users/show'

  devise_for :users
  get 'todo/index'

  get 'todo/about'

  root 'todo#about'
end
