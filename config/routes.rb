Rails.application.routes.draw do

  devise_for :users
  get 'todo/index'

  get 'todo/about'

  root 'todo#index'
end
