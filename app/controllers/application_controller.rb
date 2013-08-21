class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def record_not_found
  	flash[:notice] = "Register not found"
  	redirect_to "/"
  end
end
