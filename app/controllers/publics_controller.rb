class PublicsController < ApplicationController
  layout"public"
  # GET /publics
  # GET /publics.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publics }
    end
  end

  
end
