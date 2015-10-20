Rails.application.routes.draw do
  get 'upvote/create'

  get 'upvote/destroy'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  root :to => 'posts#index'
  resources :posts do
     resources :answers
     resources :upvotes, only: [:create, :destroy]
  end
end
