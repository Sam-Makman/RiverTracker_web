Rails.application.routes.draw do
  get 'relationship/create'

  get 'relationship/destroy'

  get 'rivers/create'

  get 'rivers/destroy'

  get 'rivers/edit'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  root "static_pages#home"

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'home' => "static_pages#home"
  resources :users
  resources :rivers
  resources :relationship, only: [:create, :destroy]
end
