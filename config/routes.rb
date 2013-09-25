Footwear::Application.routes.draw do

  get 'login/login'
  get 'login/logout'
  post 'login/login'
  post 'login/logout'
  get 'login_user/login_user'
  get 'login_user/logout_user'
  post 'login_user/login_user'
  post 'login_user/logout_user'

  match 'login' => 'login#login'
  match 'logout' => 'login#logout'
  match 'login_user' => 'login_user#login_user'
  match 'logout_user' => 'login_user#logout_user'
  match 'login_client' => 'login_client#login_client'
  match 'logout_client' => 'login_client#logout_client'

  match 'editar_empresa' => 'publics#editar_empresa'
  match 'editar_cliente' => 'publics#editar_cliente'

  match 'edit' => 'puclics#buyers'
  match 'shoe/:id' => 'publics#shoe'
  match 'enterprise/:id' => 'publics#enterprise'
  match 'category/:id' => 'publics#category'
  match 'register' => 'publics#buyers'
  match 'register_enterprise' => 'publics#sellers'
  match 'buy/:id' => 'publics#buy', via: :post
  match 'cart' => 'publics#cart'
  match 'remove/:id' => 'publics#remove', via: :delete
  match 'checkout' => 'publics#close_order'
  match 'all_releases' => 'publics#all_releases'
  match 'all_shoes' => 'publics#all_shoes'
  match 'all_bestsellers' => 'publics#all_bestsellers'
  match 'request/:id' => 'publics#order'

  match 'search' => 'publics#search', via: :post

  match 'mysales' => 'shoes#mysales'
  match 'mysalesdetails/:id' => 'shoes#mysalesdetails', as: :order_id

  match 'myorders' => 'publics#myorders'
  match 'myorderdetails/:id' => 'publics#myorderdetails', as: :order_id

  match 'orders' => 'people#orders'
  match 'orderdetails/:id' => 'people#orderdetails', as: :order_id  

  resources :enterprises do
    member do
      get :shoes
    end
  end

  resources :shoes
  resources :publics
  resources :clients

  resources :people
  resources :categories


  root to: 'publics#index'
end