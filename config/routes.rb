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
end