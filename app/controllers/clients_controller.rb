#encoding: utf-8
class ClientsController < ApplicationController
  layout 'admin'

  respond_to :html
  before_filter :logged?

  def logged?
    redirect_to '/people' if !session[:admin]
  end
  
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    begin
    @client = Client.new(params[:client])
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente criado' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
    rescue => e
      @client = Client.new(params[:client].except(:plain_password))
      flash[:notice] = e.to_s
      render :new
    end
  end

  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Cliente atualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit'}
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end

    rescue => e
      @client = Client.new(params[:client].except(:plain_password))
      flash[:notice] = e.to_s
      render :edit
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
  end
end