Rails.application.routes.draw do

  root "static_pages#home"

  get 'api/login'
  post 'api/signup'
  get 'api/rivers'
  get 'api/river'
  get 'api/favorites'
  get 'api/favorite'

  # get 'alert/create'
  # get 'alert/destroy'
  get 'relationship/create'
  get 'relationship/destroy'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'home' => "static_pages#home"
  get 'pending' => 'rivers#pending'
  get 'approve'   => 'rivers#approve'

  resources :users
  resources :rivers
  resources :relationship, only: [:create, :destroy]
  resources :alerts
end
