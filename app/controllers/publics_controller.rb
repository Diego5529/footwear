# encoding: utf-8
class PublicsController < ApplicationController
  respond_to :html
  layout :layout_public
  before_filter :load_shoes, only: [:index]
  before_filter :load_enterprises
  before_filter :load_bestsellers
  before_filter :load_releases, :load_categories, :load_orders

  #after_filter :expire_cache, :only=>[:update,:destroy]

  def layout_public
    return "admin" if session[:admin]
    return "enterprise" if !session[:admin] && session[:permit] && session[:id]
    return "client" if !session[:admin] && session[:id]
    "public"
  end

  # def expire_cache
  # expire_page controller: "public", action: "shoe", id: @shoe.id
  # end

  def index
    flash[:notice] = "#{params[:redirect]} não encontrado" if params[:redirect]
  end

  def logout
    [:id,:email,:name,:admin,:permit].each { |id| session[id] = nil }
    redirect_to '/'
  end

  def buyers
    @client = Client.new
    if request.post?
      @client = Client.new(params[:client])
      if !@client.save
        flash[:notice] = 'Não consegui salvar'
      else
        redirect_to '/'
      end
    end
  end

  def sellers
    @enterprise = Enterprise.new
    if request.post?
      @enterprise = Enterprise.new(params[:enterprise])
      @enterprise.permit = true
      if !@enterprise.save
        flash[:notice] = 'Não consegui salvar'
      else
        redirect_to '/'
      end
    end
  end

  def shoe
    @shoe = Shoe.find(params[:id]) rescue nil
    if !@shoe
      flash[:notice] = 'Sapato não encontrado'
      redirect_to'/'
      return
    end
    @enterprises = Enterprise.permited.order("name ASC").all
  end

  def enterprise
    @enterprise = Enterprise.find(params[:id]) rescue nil
    if !@enterprise
      flash[:notice] = 'Empresa não encontrada.'
      redirect_to '/'
      return
    end
    @shoes = Shoe.by_enterprise(@enterprise.id).order("name ASC").permited
  end

  def category
    @category = Category.find(params[:id]) rescue nil
    if !@category
      flash[:notice] = 'Categoria não encontrada.'
      redirect_to '/'
      return
    end
    @shoes = Shoe.by_category(@category.id).order("name ASC").permited
  end
  
  def buy
    @shoe = Shoe.find(params[:id]) rescue nil
    if !@shoe
      flash[:notice] = 'Shoe Not Found'
      redirect_to '/'
      return
    end
    @cart = find_cart
    @cart << @shoe
    redirect_to :action=>:cart
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def cart
    @cart = find_cart
    @shoes = Shoe.page(params[:page]).per(5).order("lock_version DESC").permited
  end

  def remove
    @shoe = Shoe.find(params[:id]) rescue nil
    @cart = find_cart
    @cart - @shoe
  end

  def editar_empresa
    @enterprise = Enterprise.find(session[:id])
    if request.put?
      flash[:notice] = 'Dados atualizados' if @enterprise.update_attributes(params[:enterprise])
    end
  end

  def editar_cliente
    @client = Client.find(session[:id])
    if request.put?
      flash[:notice] = 'Dados atualizados' if @client.update_attributes(params[:client])
    end
  end

  def create_order
    order = Order.new
    @client = Client.find(session[:id])
    cart = find_cart
    Shoe.transaction do
      for item in cart.items
        order.order_items << OrderItem.new(shoe_id: item.id, value: item.value, client_id: @client.id, enterprise_id: item.enterprise.id)
        item.reload.sell
    end
      order.save ? order : nil
    end
  rescue Exception => e
    flash[:notice] = 'Erro: #{e}'
    false
  end

  def close_order
    @order = create_order
    if !@order
      flash[:notice] = 'Unable to create request'
      redirect_to '/login_client'
      return
    end
    @email = session[:email]
    find_cart.clear
    if @order.total > 0
      Thread.new do
        OrderMailer.order_created(@order,@email).deliver
        grouped = @order.grouped_by_enterprise
        for email,items,client in grouped
          OrderMailer.enterprise_order_created(email,items).deliver
        end
      end
      redirect_to :action=>:order, :id=>@order.id
    else
      redirect_to '/'
    end
  end

  def order
    @order = Order.find(params[:id])
  rescue nil
    if !@order
      flash[:notice] = 'Not Found'
      redirect_to '/'
    end
  end

  def myorders
    @orders = OrderItem.order("created_at DESC").by_client(session[:id])
  end

  def myorderdetails
    @orders = OrderItem.find(params[:id])
  end

  def all_releases
    @all_releases = Shoe.order("created_at DESC").where("permit = ?", true).all
  end

  def all_bestsellers
    @all_bestsellers = Shoe.permited.order("lock_version DESC").first(12)
  end

  def all_shoes
    @all_shoes = Shoe.page(params[:page]).per(3).permited.order('random()').first(12)
  end

  def search
    @search = Shoe.page(params[:page]).per(6).permited.search params[:search]
  end

  private

  def load_shoes
    @shoes = Shoe.permited.order('random()').first(12)
  end

  def load_enterprises
    @enterprises = Enterprise.permited.order("name ASC").all
  end

  def load_bestsellers
    @bestsellers = Shoe.permited.order("lock_version DESC").first(3)
  end

  def load_releases
    @releases = Shoe.order("created_at DESC").where("permit = ?", true).first(3)
  end

  def load_categories
    @categories = Category.first(6)   
  end

  def load_orders
    @orders = OrderItem.all
  end
end