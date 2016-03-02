Rails.application.routes.draw do
  root "static_pages#home"
  get 'relationship/create'
  get 'relationship/destroy'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'home' => "static_pages#home"
  resources :users
  resources :rivers
  resources :relationship, only: [:create, :destroy]
end
