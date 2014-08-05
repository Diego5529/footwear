#encoding: utf-8
class LoginController < ApplicationController
  layout "public"

  def login
    if request.post?
      name = params[:name]
      password = params[:password]
      LoginParms.check_by_name(name,password)

      person = Person.auth(name,password)
      raise LoginException.new('Falha no login') if !person
      raise LoginException.new('Você não é administrador') if !person.admin

      flash[:notice] = "Bem-vindo, #{person.name}!"
      session[:id] = person.id
      session[:name] = person.name
      session[:admin] = person.admin
      redirect_to people_path
    end
  rescue LoginException => e
    flash[:notice] = e.to_s
  end

  def logout
    session[:id] = nil
    session[:name] = nil
    session[:admin] = nil
    redirect_to '/'
  end

  def index
    redirect_to :action=>'/'
  end
end