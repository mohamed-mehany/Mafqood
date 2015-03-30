Rails.application.routes.draw do
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/edit_profile', to: 'users#edit', as: 'edit_profile'
  get '/auth/:provider', to: 'sessions#new', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#new'
  get '/auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/my_posts', to: 'users#posts', as: 'my_posts'
  resources :users
  resources :suspect_posts
  resources :finding_posts
  resources :missing_posts
end
