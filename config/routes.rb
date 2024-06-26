Rails.application.routes.draw do


  resources :dogs
  resources :events
  resources :users
  get 'access/authenticated'
  get 'access/login'
  get 'access/attempt_login'
  get 'access/logout'
  get 'access/dogmenu'
  get 'access/eventmenu'
  get 'access/admin'
  get 'public/index'
  get 'public/registration'
  get 'public/event_search'
  resources :conversations do
    resources :messages
  end
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :event_registrations
  resources :pedigrees
  resources :password_resets, only: [:new, :create, :edit, :update]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'public#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'admin', :to => "access#admin"
  get 'dog-search', :to => "dogs#dog_search"
  get 'event-search', :to => "events#event_search"
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
