#encoding: utf-8
class LoginUserController < ApplicationController
  layout 'public'

  def login_user
    if request.post?
      email   = params[:email]
      password = params[:password]
      permit = params[:permit]

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

      enterprise = Enterprise.auth(email,password)
      if  !enterprise 
        flash[:notice] = 'Falha no login'
        return
      end

      flash[:notice]  = 'Bem-vindo, #{enterprise.email}!'
      session[:id]  = enterprise.id
      session[:email]  = enterprise.email
      session[:name]  = enterprise.name
      session[:permit] = true
      redirect_to shoes_path
    end
  end

  def logout_user
    session[:id]  = nil
    session[:email]  = nil
    session[:name] = nil
    redirect_to '/'
  end

  def index
    redirect_to :action=>'/'
  end
end