Footwear::Application.routes.draw do

  get 'login/login'
  get 'login/logout'
  post 'login/login'
  post 'login/logout'

  match 'login' => 'login#login'
  match 'logout' => 'login#logout'
  match 'login_user' => 'login_user#login_user'
  match 'logout_user' => 'login_user#logout_user'
  match 'login_client' => 'login_client#login_client'
  match 'logout_client' => 'login_client#logout_client'

  match 'edit' => 'puclics#buyers'
  match 'shoe/:id' => 'publics#shoe'
  match 'enterprise/:id' => 'publics#enterprise'
  match 'register' => 'publics#buyers'
  match 'register_enterprise' => 'publics#sellers'
  match 'buy/:id' => 'publics#buy', via: :post
  match 'cart' => 'publics#cart'
  match 'remove/:id' => 'publics#remove', via: :delete
  match 'checkout' => 'publics#close_order'
  match 'request/:id' => 'publics#order'
  match 'editar_empresa' => 'publics#editar_empresa'
  match 'editar_cliente' => 'publics#editar_cliente'

  resources :enterprises do
    member do
      get :shoes
    end
  end

  resources :shoes
  resources :publics
  resources :people
  resources :clients

  root to: 'publics#index'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  # This route can be invoked with purchase_url(id: product.id)

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
  #       get 'recent', on: :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end