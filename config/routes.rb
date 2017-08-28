Rails.application.routes.draw do

  get 'todo/index'

  get 'todo/about'

  root 'todo#index'
end
