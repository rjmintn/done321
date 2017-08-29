Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  get 'todo/index'

  get 'todo/about'

  root 'todo#about'
end
