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
  get '/my_posts/:id/found', to: 'missing_posts#report_found', as: 'report_child_as_found'
  get '/my_posts/:id/returned', to: 'finding_posts#report_returned', as: 'report_child_as_returned'
  resources :users
  resources :suspect_posts
  resources :finding_posts
  resources :missing_posts
end
