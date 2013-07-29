#encoding: utf-8
class LoginController < ApplicationController
	layout "public"
  def login
	if request.post?
	name	 = params[:name]
	password = params[:password]
	admin	 = params[:admin]

	if name.blank? && password.blank?
	flash[:notice] = "Enter the name and password"
	return
	end

	if name.blank?
	flash[:notice] = "Enter the name"
	return
	end
	
	if password.blank?
	flash[:notice] = "Enter the password"
	return
	end

	
	person = Person.auth(name,password)
	if !person
	flash[:notice] = "Failed Login"
	return
	end

	if person.admin == false
	flash[:notice] = "You are not Administrator"
	return
	end
	
	flash[:notice]	= "Welcome, #{person.name}!"
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

	def index
		redirect_to :action=>"/"
	end
end
