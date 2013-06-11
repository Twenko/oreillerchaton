ActionController::Routing::Routes.draw do |map|
  map.resources :pictures
  #map.connect ':name', :controller => :galleries, :action => :update, :method => :put
  #map.connect ':name', :controller => :galleries, :action => :show, :method => :get

  map.resources :galleries

  map.resources :indices
  
  map.resources :datafiles
  #map.resources :uploads

  map.devise_for :users, :as => "users", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock' }

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => 'indices', :action => 'index'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect '/index', :controller => :indices, :action => :index
  map.connect '/changepics', :controller => :pictures, :action => :index2
  map.connect '/allpics', :controller => :pictures, :action => :index
  map.connect '/gallerie/modify', :controller => :galleries, :action => :index2
  map.connect '/gallerie/addpics/:id', :controller => :galleries, :action => :show2
  #map.editgallery 'galleries/:name/edit', :controller => :galleries, :action => :edit
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
