#encoding: utf-8
class LoginUserController < ApplicationController
      layout "public"

        def login_user
            if request.post?
              email   = params[:email]
              password = params[:password]

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

            enterprise = Enterprise.auth(email,password)
            if  !enterprise
            flash[:notice] = "Failed Login"
            return
            end

            flash[:notice]  = "Welcome, #{enterprise.email}!"
            session[:id]  = enterprise.id
            session[:email]  = enterprise.email
            session[:name]  = enterprise.name
            session[:admin] = false
            redirect_to shoes_path
          end
        end

        def logout_user
          session[:id]  = nil
          session[:email]  = nil
          session[:admin] = nil
          redirect_to "/" #:action=>:login_user
        end

        def index
          redirect_to :action=>"/"
        end
end