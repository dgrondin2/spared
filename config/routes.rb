Spared::Application.routes.draw do
  resources :item_offers, :events, :donations, :wishlists
  resources :users
  resources :sessions

  get 'home/index'
  get 'sessions/new'

  match '/about' => 'home#about', as: "about"
  match '/faqs' => 'home#faqs', as: "faqs"
  match '/contact' => 'home#contact', as: 'contact'
  match '/shop' => 'home#shop', as: 'shop'

  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/donor/register', to: 'donors#new', as: 'donor_register'
  get '/donor/login', to: 'sessions#donor_login', as: 'donor_login'
  post '/donor/register-new-donor', to: 'donors#create', as: 'donor_create'

  get '/donor/edit-profile', to: 'donors#edit', as: 'donor_edit'
  put '/donor/update-profile', to: 'donors#update', as: 'donor_update'

  match '/donor/item-offers', to: 'item_offers#overview', as: 'donor_item_offer_overview'
  match '/donor/item-offers/new', to: 'item_offers#new', as: 'donor_new_item_offer'
  match '/donor/item-offers/index', to: 'item_offers#index', as: 'donor_item_offers'
  match '/donor/item-offers/:id', to: 'item_offers#show'
  match '/donor/wishlists', to: 'wishlist_items#index', as: 'donor_wishlists'
  match '/donor/events', to: 'events#new', as: 'donor_new_event'
  match '/donor/events/index', to: 'events#index', as: 'donor_events'
  get '/donor/events/show/:id', to: 'events#show'
  match '/donor/donations', to: 'donations#new', as: 'donor_new_donation'

  # My Dashboard
  match '/donor', to: 'donors#overview', as: "donor_overview"
  match '/donor/my-item-offers', to: 'donors#my_item_offers', as: 'donor_my_item_offers'
  match '/donor/my-donations', to: 'donors#my_donations', as: 'donor_my_donations'
  match '/donor/my-events', to: 'donors#my_events', as: 'donor_my_events'

  get '/org/register', to: 'organizations#new', as: 'org_register'
  get '/org/login', to: 'sessions#org_login', as: 'org_login'
  post 'org/register-new-org', to: 'organizations#create', as: 'org_create'

  get '/org/edit-profile', to: 'organizations#edit', as: 'org_edit'
  put '/org/update-profile', to: 'organizations#update', as: 'org_update'

  get '/org/item-offers', to: 'item_offers#index', as: 'org_item_offers'
  get '/org/item-offers/:id', to: 'item_offers#show', as: 'org_show_item_offer'
  get '/org/wishlists/index', to: 'wishlists#index', as: 'org_wishlists' # browse wishlists
  #TODO: BUG: Uncommenting the next line breaks the org_new_wishlist path because it goes to :show when it should be going to :new
  #get '/org/wishlists/:id', to: 'wishlists#show'
  get '/org/wishlists/new', to: 'wishlists#new', as: 'org_new_wishlist'
  get '/org/my-wishlists', to: 'wishlists#my_wishlists', as: 'org_my_wishlists' # not in My Dashboard
  get '/org/events', to: "events#new", as: 'org_new_event'
  get '/org/events/index', to: "events#index", as: 'org_events'
  get '/org/events/show/:id', to: "events#show"
  get '/org/events/manage', to: "events#manage", as: 'org_manage_events'
  get '/org/donations', to: 'donations#index', as: 'org_donations'
  get '/org/donations/distribute', to: 'donations#distribute', as: 'org_distribute_donations'

  # My Dashboard
  get '/org', to: 'organizations#overview', as: 'org_overview'
  get '/org/my-item-matches', to: 'organizations#my_item_matches', as: 'org_my_item_matches'
  get '/org/my-donations', to: 'organizations#my_donations', as: 'org_my_donations'
  get '/org/my-events', to: 'organizations#my_events', as: 'org_my_events'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
