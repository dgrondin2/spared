Spared::Application.routes.draw do

    devise_for :organizations

    devise_for :donors
	

    # TODO: Uncomment the following two blocks when setting up Devise:

	#resources :organizations do
	#	resources :items     # Wishlist items
	#	resources :events    # Volunteering events being hosted
	#	resources :donations # Donation money received
	#end
	
	#resources :donors do
	#	resources :items     # Donated items
	#	resources :events    # Events at which donor has volunteered
	#	resources :donations # Donation money given
	#end

	resources :item_offers
	
	get 'home/index'
	get 'sessions/new'
	
	match '/about'   => 'home#about'
	match '/faqs'	 => 'home#faqs'
	match '/contact' => 'home#contact'
	match '/shop'    => 'home#shop'
	
	match '/donor/register'     => 'donors#new'
	match '/org/register'  => 'organizations#new'
	
	devise_scope :donor do 
		match '/donor/login' => 'donors#login'
	end

	devise_scope :organization do
		match '/org/login' => 'organizations#sessions/new'
	end

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

  match '/donor/'               => 'donor#overview'
  match '/donor/my-item-offers' => 'donor#submitted_item_offers'
  match '/donor/my-donations'   => 'donor#donation_history'
  match '/donor/my-events'      => 'donor#volunteer_calendar'




	
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
