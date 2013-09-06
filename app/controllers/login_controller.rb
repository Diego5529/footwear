#encoding: utf-8
class LoginController < ApplicationController
  layout "public"

  def login
    if request.post?
      name = params[:name]
      password = params[:password]
      admin = params[:admin]

      if name.blank? && password.blank?
        flash[:notice] = "Digite o nome e senha"
        return
      end

      if name.blank?
        flash[:notice] = "Digite o nome"
        return
      end

      if password.blank?
        flash[:notice] = "Digite a senha"
        return
      end

      person = Person.auth(name,password)
      if !person
        flash[:notice] = "Falha no login"
        return
    end

    if !person.admin
      flash[:notice] = "Você não é administrador"
      return
    end
    
      flash[:notice]	= "Bem-vindo, #{person.name}!"
      session[:id]	= person.id
      session[:name]	= person.name
      session[:admin]	= person.admin
      redirect_to people_path
    end
  end

  def logout
    session[:id]	= nil
    session[:name]	= nil
    session[:admin] = nil
    redirect_to "/"
  end

  def index
    redirect_to :action=>"/"
  end
end
