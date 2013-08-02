class ShoesController < ApplicationController
layout"enterprise"
respond_to :html
before_filter :logged?

def logged?
  redirect_to "/login_user" if !session[:id]
end

  def index
    @shoes = Shoe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shoes }
    end
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
    @shoe = Shoe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shoe }
    end
  end

  # GET /shoes/new
  # GET /shoes/new.json
  def new
    @shoe = Shoe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shoe }
    end
  end

  # GET /shoes/1/edit
  def edit
    @shoe = Shoe.find(params[:id])
  end

  def currentEnterprise
    Enterprise.find(session[:id])
  end

  def create
    @shoe = currentEnterprise.shoes.new(params[:shoe])
    @shoe.save
    respond_with @shoe
  end

  # PUT /shoes/1
  # PUT /shoes/1.json
  def update
    @shoe = Shoe.find(params[:id])

    respond_to do |format|
      if @shoe.update_attributes(params[:shoe])
        format.html { redirect_to @shoe, notice: 'Shoe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoes/1
  # DELETE /shoes/1.json
  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy

    respond_to do |format|
      format.html { redirect_to shoes_url }
      format.json { head :no_content }
    end
  end

  private
  def load_enterprises
    @enterprises = Enterprise.for_select
  end

  def image_title_ref
    "Shoes Picture"
  end
end
