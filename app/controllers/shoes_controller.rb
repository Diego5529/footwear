#encoding: utf-8
class ShoesController < ApplicationController
  respond_to :html
  before_filter :logged?, :load_categories
  layout :layout

  def layout
    session[:admin] ? 'admin' : 'enterprise'
  end

  def logged?
    if !session[:permit] && !session[:admin]
      redirect_to '/login_user'
    end
  end

  def index
    @shoes = session[:admin] ? Shoe.order('enterprise_id ASC').all : Shoe.by_enterprise(session[:id])
    @enterprise = Enterprise.find(session[:id]) rescue nil
  end

  def show
    @shoe = Shoe.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shoe }
    end
  end

  def new
    @shoe = Shoe.new
  end

  def edit
    @shoe = Shoe.find(params[:id])
    return if !check_allowed_shoe(@shoe)
  end

  def currentEnterprise
    Enterprise.find(session[:id])
  end

  def create
    @shoe = currentEnterprise.shoes.new(params[:shoe])
    @shoe.permit = true
    @shoe.save
    respond_with @shoe
  end

  def update
    @shoe = Shoe.find(params[:id])

    respond_to do |format|
      if @shoe.update_attributes(params[:shoe])
        format.html { redirect_to @shoe, notice: 'Cadastrado com Sucesso!.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    p params, Shoe.find(params[:id])
    p '-------------------------------------'
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to '/shoes'
  end

  def mysales
    @orders = OrderItem.order('created_at DESC').by_enterprise(session[:id])
  end

  def mysalesdetails
    @orders = OrderItem.find(params[:id])
  end

  def image_title_ref
    'Shoes Picture'
  end

  def check_allowed_shoe(shoe)
    if !session[:admin] && shoe.enterprise_id != session[:id]
      redirect_to action: 'index'
      return false
    end
    true
  end

  private
  def load_enterprises
    @enterprises = Enterprise.for_select
  end

  def load_categories
    @categories = Category.all
  end
end