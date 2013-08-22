#encoding: utf-8
class LoginClientController < ApplicationController
  layout 'public'

  def login_client
    if request.post?
      email   = params[:email]
      password = params[:password]
      name = params[:name]

      if email.blank? && password.blank?
        flash[:notice] = 'Digite o e-mail e senha'
        return
      end

      if email.blank?
        flash[:notice] = 'Digite o e-mail'
        return
      end

      if password.blank?
        flash[:notice] = 'Digite a senha'
        return
      end

      client = Client.auth(email,password)
      if  !client
        flash[:notice] = 'Falha no login'
        return
      end

      flash[:notice]  = 'Bem-vindo, #{client.email}!'
      session[:id]  = client.id
      session[:email]  = client.email
      session[:name] = client.name
      redirect_to '/cart'
    end
  end

  def logout_client
    session[:id]  = nil
    session[:email]  = nil
    session[:name] = nil
    redirect_to '/'
  end

  def index
    redirect_to action: '/'
  end
end
