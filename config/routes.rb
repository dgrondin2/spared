Spared::Application.routes.draw do
	resources :item_offers, :wishlist_items, :events, :donations
  resources :users
  resources :sessions

	get 'home/index'
	get 'sessions/new'
	
	match '/about'   => 'home#about'
	match '/faqs'	 => 'home#faqs'
	match '/contact' => 'home#contact'
	match '/shop'    => 'home#shop'

  #TODO: Org auth routes/
  get '/donor/register', to: 'donors#new', as: 'register'
  get '/donor/login', to: 'sessions#new', as: 'login'
  get '/donor/logout', to: 'sessions#destroy', as: 'logout'
  post '/donor/register-new-donor', to: 'donors#create', as: 'register_new_donor'

	match '/donor/item-offers'       => 'item_offers#overview' 	# "DONATE ITEMS"
	match '/donor/item-offers/new'	 => 'item_offers#new'
	match '/donor/item-offers/index' => 'item_offers#index'		  # "BROWSE ITEM-OFFER BOARD"
	match '/donor/item-offers/:id'   => 'item_offers#show'
# TODO: Better URL for wishlists
#   - misleading because wishlists are made by orgs
	match '/donor/wishlists'         => 'wishlist_items#index'
	match '/donor/events'            => 'events#new'
	match '/donor/events/index'      => 'events#index'
	match '/donor/donations'         => 'donations#new'

  match '/donor/'               => 'donors#overview', as: "donors_overview"
  match '/donor/my-item-offers' => 'donors#my_item_offers'
  match '/donor/my-donations'   => 'donors#my_donations'
  match '/donor/my-events'      => 'donors#my_events'




	
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
