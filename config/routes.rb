Leveredge::Application.routes.draw do

  namespace :api , defaults: {format: 'json'} do
    namespace :v1 do
      devise_for :artists

      devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :token_authentication_key => 'authentication_key'
      resources :users, :only => [:show]
      match 'users/:id' => 'users#show', :via => :delete, :as => :user_pre_qual
      get 'users/:id/contribution_counts' => 'users#contribution_counts', as: :contribution_counts
      get 'users/:id/favorites' => 'users#favorites', as: :favorites

      resources :vendors, :only => [:index, :show]
      resources :pre_qualifications, param: :vendor_id
      resources :hotels, :only => [:index, :show]

      get 'tags/artist_work' => 'tags#artist_work', :as => :artist_work
      resources :tags, :only => [:index, :show, :create]
      match 'tags/:id' => 'tags#show', :via => :delete

      # match 'suggestions/:id' => 'suggestions#show', :via => :delete
      resources :suggestions, :only => [:create, :show, :index]
      get 'suggestions/:id/proposals' => 'suggestions#suggestions_proposals'

      resources :upvotes, :only => [:create, :show, :destroy]
      get 'upvoted' => 'upvotes#upvoted', :as => :upvoted

      resources :favorites, :only => [:create, :show, :destroy]
      get 'favorited' => 'favorites#favorited', :as => :favorited

    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



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
