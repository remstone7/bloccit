Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  resources :users, only: [:new, :create]
  get 'welcome/new'


  root 'welcome#index'
end
