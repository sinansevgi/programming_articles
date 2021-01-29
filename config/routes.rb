Rails.application.routes.draw do
  get 'sessions/new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :sessions

  resources :categories
  resources :articles,  only: %i[new create update edit show destroy] do
    resources :votes, only: %i[create destroy]
  end
  root to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
