#encoding: utf-8
class LoginClientController < ApplicationController
  layout 'public'

  def login_client
    if request.post?
      email     = params[:email]
      password  = params[:password]
      LoginParms.check_by_email(email,password)

      client = Client.auth(email,password)
      raise LoginException.new("Falha no login") if !client

      flash[:notice]  = 'Bem-vindo, #{client.email}!'
      session[:id]    = client.id
      session[:email] = client.email
      session[:name]  = client.name
      redirect_to '/cart'
    end
  rescue LoginException => e
    flash[:notice] = e.to_s
  end

  def logout_client
    session[:id]    = nil
    session[:email] = nil
    session[:name]  = nil
    redirect_to '/'
  end

  def index
    redirect_to action: '/'
  end
end
