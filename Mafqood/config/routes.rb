Rails.application.routes.draw do
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/edit_profile', to: 'users#edit', as: 'edit_profile'
  get '/auth/:provider', to: 'sessions#new', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#new'
  get '/auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get 'finding_posts/:id/mine', to: 'finding_posts#mine', as: 'finding_post_mine'
  get 'finding_posts/new'
  get 'missing_posts/:id/report', to: 'missing_posts#report', as: 'missing_post_report'
  get '/my_posts', to: 'users#posts', as: 'my_posts'
  get '/my_posts/:id/found', to: 'missing_posts#report_found', as: 'report_child_as_found'
  get '/my_posts/:id/returned', to: 'finding_posts#report_returned', as: 'report_child_as_returned'
  resources :users
  resources :suspect_posts
  resources :finding_posts
  resources :missing_posts
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #root 'missings#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
end
