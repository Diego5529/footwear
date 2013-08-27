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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  def create
    begin
    @client = Client.new(params[:client])   
     
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
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

  # PUT /clients/1
  def update
    @client = Client.find(params[:id])
    
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
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

  # DELETE /clients/1
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
end