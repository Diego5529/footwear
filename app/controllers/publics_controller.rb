# encoding: utf-8
class PublicsController < ApplicationController
  layout"public"
  # GET /publics
  # GET /publics.json
  def index
    #flash[:notice] = "#{params[:redirect]} não encontrado" if params[:redirect]
    @shoes = Shoe.all
  end

  def logout
    session[:id]  = nil
    session[:email]  = nil
    session[:name] = nil
    redirect_to "/"
  end

  def buyers
    @client = Client.new
    if request.post?
      @client = Client.new(params[:client])
      redirect_to "/"
      if !@client.save
        flash[:notice] = "Não consegui salvar"
      end
    end
  end

  def sellers
    @enterprise = Enterprise.new
    if request.post?
      @enterprise = Enterprise.new(params[:enterprise])
      redirect_to "/"
      if !@enterprise.save
        flash[:notice] = "Não consegui salvar"
      end
    end
  end

  def shoe
  	@shoe = Shoe.find(params[:id]) rescue nil
  	if !@shoe
  		flash[:notice] = "Shoe not Found"
  		redirect_to"/"
  		return
  		end
  	end

  	def enterprise
		@enterprise = Enterprise.find(params[:id]) rescue nil
		if !@enterprise
			flash[:notice] = "Enterprise Not Found"
			redirect_to "/"
			return
		end
		@shoes = Shoe.by_enterprise(@enterprise.id)
	end

  def buy
    @shoe = Shoe.find(params[:id]) rescue nil
    if !@shoe
      flash[:notice] = "Shoe Not Found"
      redirect_to "/"
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
  end

  def remove
    @shoe = Shoe.find(params[:id]) rescue nil
    @cart = find_cart
    @cart - @shoe
  end

  

  def create_order
    order = Order.new
    cart = find_cart
    for item in cart.items
      order.order_items << OrderItem.new(shoe_id: item.id, value: item.value)
      item.sell
    end
    order.save ? order : nil
    end

    def close_order
      @order = create_order
      if !@order
        flash[:notice] = "Unable to create request"
        redirect_to "/"
        return
      end
      find_cart.clear
      redirect_to :action=>:order, :id=>@order.id
    end

    def order
      @order = Order.find(params[:id]) rescue nil
      if !@order
        flash[:notice] = "Not Found"
        redirect_to "/"
        end
    end

end
