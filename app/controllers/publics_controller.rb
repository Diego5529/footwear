# encoding: utf-8
class PublicsController < ApplicationController
  respond_to :html
  layout :layout_public
  after_filter :expire_cache, :only=>[:update,:destroy]

  def layout_public
    if session[:admin]
      'admin'
    end
    if !session[:admin] && session[:permit] && session[:id]
      'enterprise'
    end
    if !session[:admin] && session[:id]
      'client'
    else
      'public'
    end
  end

  def expire_cache
    expire_page controller: "public", action: "shoe", id: @shoe.id
  end

  def index
    flash[:notice] = '#{params[:redirect]} não encontrado' if params[:redirect]
    shoes
    enterprises    
    bestsellers
    realeases
  end

  def shoes
    @shoes = Shoe.order('random()').where("permit = ?", true).all
  end

  def enterprises
    @enterprises = Enterprise.order("name ASC").where("permit = ?", true).all    
  end

  def bestsellers
    @bestsellers = Shoe.order("lock_version DESC").where("permit = ?", true).first(4)
  end

  def realeases
    @releases = Shoe.order("created_at DESC").where("permit = ?", true).first(4)
  end

  def logout
    session[:id]  = nil
    session[:email]  = nil
    session[:name] = nil
    session[:admin] = nil
    session[:permit] = nil
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
    @enterprises = Enterprise.order("name ASC").where("permit = ?", true).all
    @shoe = Shoe.find(params[:id]) rescue nil
    if !@shoe
      flash[:notice] = 'Sapato não encontrado'
      redirect_to'/'
      return
      end
  end

  def enterprise
    enterprises
    @enterprise = Enterprise.find(params[:id]) rescue nil
    if !@enterprise
      flash[:notice] = 'Empresa não encontrada.'
      redirect_to '/'
      return
    end
      @shoes = Shoe.by_enterprise(@enterprise.id).order("name ASC").where("permit = ?", true)
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
    @shoes = Shoe.page(params[:page]).per(5).order("lock_version DESC").where("permit = ?", true)
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
    cart = find_cart
    Shoe.transaction do
      for item in cart.items
        order.order_items << OrderItem.new(shoe_id: item.id, value: item.value)
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
end