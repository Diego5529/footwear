#encoding: utf-8
class LoginUserController < ApplicationController
  layout 'public'

  def login_user
    if request.post?
      email = params[:email]
      password = params[:password]

      LoginParms.check_by_email(email,password)

      enterprise = Enterprise.auth(email,password)
      raise LoginException.new("Falha no login") if !enterprise

      flash[:notice] = 'Bem-vindo, #{enterprise.email}!'
      session[:id] = enterprise.id
      session[:email] = enterprise.email
      session[:name] = enterprise.name
      session[:permit] = true
      redirect_to shoes_path
    end
  rescue LoginException => e
    flash[:notice] = e.to_s
  end

  def logout_user
    session[:id] = nil
    session[:email] = nil
    session[:name] = nil
    session[:permit] = nil
    redirect_to '/'
  end

  def index
    redirect_to :action=>'/'
  end
end