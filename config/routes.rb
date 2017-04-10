Rails.application.routes.draw do
  resources :questions

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'
  
  resources :sessions, only: [:new, :create, :destroy]

  # instead of get welcome/abc
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
