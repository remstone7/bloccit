Rails.application.routes.draw do

  resources :questions
  resources :topics do
    resources :posts, except: [:index]
  end

  # instead of get welcome/abc
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
