Spared::Application.routes.draw do

	resources :user_sessions
	
	resources :organizations do
		resources :users
		resources :items     # Wishlist items
		resources :events    # Volunteering events being hosted
		resources :donations # Donation money received
	end
	
	resources :donors do
		resources :users
		resources :items     # Donated items
		resources :events    # Events at which donor has volunteered
		resources :donations # Donation money given
	end
	
	# resources :volunteers  # No longer needed
	
	get 'home/index'
	get 'sessions/new'
	
	match '/about'   => 'home#about'
	match '/faqs'	   => 'home#faqs'
	match '/contact' => 'home#contact'
	match '/shop'    => 'home#shop'
	
	match '/register'     => 'donors#new'
	match '/orgregister'  => 'organizations#new'
	
	match '/login'       => 'user_sessions#donorlogin'
	match '/orglogin'    => 'user_sessions#orglogin'
	
	match '/donateitems' => 'user_sessions#donateitems'
	match '/donatetime'  => 'user_sessions#donatetime'
	match '/donatemoney' => 'user_sessions#donatemoney'
	
	match '/itemoffers'  => 'items#index'
	match '/wishlists'   => 'wishlist_items#index'
	match '/volunteer'   => 'events#index'
	
	match '/overview'	=> 'sessions#donoroverview'
	
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
