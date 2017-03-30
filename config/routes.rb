Rails.application.routes.draw do

  resources :questions

  # instead of get 'posts/abc'
  resources :posts

  # instead of get welcome/abc
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
