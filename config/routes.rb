Rails.application.routes.draw do

  resources :lists do
    resources :items
  end
  resources :posts

  get 'users/show'

  devise_for :users, controllers: {sessions: 'users/sessions'}

  get 'todo/index'

  get 'todo/about'

  root 'todo#about'
end
