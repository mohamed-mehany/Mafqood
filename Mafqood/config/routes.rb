Rails.application.routes.draw do
  root 'home#index'
  resources :users
  get 'auth/:provider', to: 'sessions#new', as: 'login'
  get 'auth/:provider/callback', to: 'users#new'
  get 'auth/failure', to: redirect('/')
  get 'logout' => 'sessions#destroy', as: 'logout'
end
