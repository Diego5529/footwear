#encoding: utf-8
class LoginClientController < ApplicationController
  layout "public"

    def login_client
      if request.post?
        email   = params[:email]
        password = params[:password]
        name = params[:name]

      if email.blank? && password.blank?
        flash[:notice] = "Enter the email and password"
      return
      end

      if email.blank?
        flash[:notice] = "Enter the email"
        return
      end

      if password.blank?
      flash[:notice] = "Enter the password"
      return
      end

      client = Client.auth(email,password)
      if  !client
      flash[:notice] = "Failed Login"
      return
      end

      flash[:notice]  = "Welcome, #{client.email}!"
      session[:id]  = client.id
      session[:email]  = client.email
      session[:name] = client.name
      redirect_to "/cart"
    end
  end

  def logout_client
    session[:id]  = nil
    session[:email]  = nil
    session[:name] = nil
    redirect_to "/"
  end

  def index
    redirect_to action: "/"
  end
end
