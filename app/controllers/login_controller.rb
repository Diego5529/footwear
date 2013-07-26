class LoginController < ApplicationController
  def login
	if request.post?
	name	 = params[:name]
	password = params[:password]

	if name.blank? && password.blank?
	flash[:notice] = "Informe name e senha"
	return
	end
	
	if name.blank?
	flash[:notice] = "Informe o name"
	return
	end
	
	if password.blank?
	flash[:notice] = "Informe a senha"
	return
	end
	
	person = Person.auth(name,password)
	if !person
	flash[:notice] = "Falha no login"
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
		redirect_to :action=>:login
	end
end
