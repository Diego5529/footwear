#encoding: utf-8
class ShoesController < ApplicationController
  respond_to :html
  before_filter :logged?
  layout :layout

  def layout
    if session[:admin]
      "admin"
    else
      "enterprise"
    end
  end

  def logged?
    redirect_to "/login_user" if !session[:id]
  end

  def index
    @shoes = session[:admin] ? Shoe.all : Shoe.by_enterprise(session[:id])
    @enterprise = Enterprise.find(session[:id]) rescue nil

    #@shoes = Shoe.find(params[:id])
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
    @shoe = Shoe.find(params[:id])
  end

  # GET /shoes/new
  # GET /shoes/new.json
  def new
    @shoe = Shoe.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @shoe }
    # end
  end

  # GET /shoes/1/edit
  def edit
    @shoe = Shoe.find(params[:id])
    return if !check_allowed_shoe(@shoe)
  end

  def edit_enterprise
    redirect_to "/"
    @enterprise = Enterprise.find(params[:id])
  end

  def currentEnterprise
    Enterprise.find(session[:id])
  end

  def create
    @shoe = currentEnterprise.shoes.new(params[:shoe])
    @shoe.save
    respond_with @shoe
  end

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

  def check_allowed_shoe(shoe)
    if !session[:admin] && shoe.enterprise_id != session[:id]
      redirect_to action: "index"
      return false
      
    end
    true
  end
end
