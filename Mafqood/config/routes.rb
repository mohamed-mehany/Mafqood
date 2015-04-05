Rails.application.routes.draw do
  root 'home#index'
  resources :users
  get '/edit_profile', to: 'users#edit', as: 'edit_profile'
  get '/auth/:provider', to: 'sessions#new', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#new'
  get '/auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get 'finding_posts/new'
  
  get 'finding_posts/:id/spam', to: 'finding_posts#report1_finding', as: 'finding_post_report1_finding'
  get 'finding_posts/:id/fake', to: 'finding_posts#report2_finding', as: 'finding_post_report2_finding'
  get 'finding_posts/:id/duplicate', to: 'finding_posts#report3_finding', as: 'finding_post_report3_finding'
  
  get 'missing_posts/:id/spam', to: 'missing_posts#report1_finding', as: 'missing_post_report1_missing'
  get 'missing_posts/:id/fake', to: 'missing_posts#report2_finding', as: 'missing_post_report2_missing'
  get 'missing_posts/:id/duplicate', to: 'missing_posts#report3_finding', as: 'missing_post_report3_missing'

  get 'suspect_posts/:id/spam', to: 'suspect_posts#report1_finding', as: 'suspect_post_report1_missing'
  get 'suspect_posts/:id/fake', to: 'suspect_posts#report2_finding', as: 'suspect_post_report2_missing'
  get 'suspect_posts/:id/duplicate', to: 'suspect_posts#report3_finding', as: 'suspect_post_report3_missing'


  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :suspect_posts,:finding_posts
  
  resource :search do
    collection do
      post 'searchfind', controller: :search
    post 'searchmissing', controller: :search
    post 'searchsuspect', controller: :search
    end
  end

  # get '/search_find' => 'search#searchfind'


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
  resources :missing_posts

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
