# encoding: utf-8

class PublicsController < ApplicationController
  layout"public"
  # GET /publics
  # GET /publics.json
  def index
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @publics }

      @shoes = Shoe.all
    # end
  end

  def signup
    @client = Client.new
    if request.post?
      @client = Client.new(params[:client])
      if !@client.save
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
end
