# ActionController::Routing::Routes.draw do |map|
#   map.resources :faqs

#   map.devise_for :admins

#   map.resources :admins do |admin|
#     admin.resources :providers, :member => { :activate => :put, :deactivate => :put }
#   end
  
#   map.admin_root '/admins', :controller => 'providers', :action => 'index'
  
#   map.resources :salesmen
  
#   map.resources :subscriptions do |subscriptions|
#     subscriptions.resources :payment_notifications
#   end
  
#   map.congrats 'congratulations/:id', :controller => "subscriptions", :action => "congrats"
#   map.resources :payment_notifications
#   map.devise_for :providers
  
#   map.provider_root '/providers', :controller => 'providers', :action => 'show'
  
#   map.resources :providers do |providers|
#     providers.resources :vehicles, :member => {:mark_as_sold => :put, :select_for_week => :put}
#     providers.resources :subscriptions, :has_many => :payment_notifications
#     providers.resources :salesmen
#   end

#   map.devise_for :users
  
#   map.user_root '/users', :controller => 'users', :action => 'show'
  
#   map.resources :users do |users|
#     users.resources :search_profiles
#     users.resources :selections
#   end
  
#   map.resources :categories
#   map.resources :vehicles, :member => { :print => :get, :select => :put, :tellafriend => :post }
#   map.resources :searches
#   map.resources :selections
  
#   map.root :controller => "welcome"
# end

Rails.application.routes.draw do
  devise_for :providers
  devise_for :users
  devise_for :admins
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
