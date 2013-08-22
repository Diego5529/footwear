#encoding: utf-8
class EnterprisesController < ApplicationController
  layout 'admin'
  
  respond_to :html
  before_filter :logged?

  def logged?
    redirect_to '/people' if !session[:admin]
  end

  def index
    @enterprises = Enterprise.all
  end

  # GET /enterprises/1
  def show
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enterprise }
    end
  end

  # GET /enterprises/new
  def new
    @enterprise = Enterprise.new
  end

  # GET /enterprises/1/edit
  def edit
    @enterprise = Enterprise.find(params[:id])
  end

  # POST /enterprises
  def create
    begin
    @enterprise = Enterprise.new(params[:enterprise])

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully created.' }
        format.json { render json: @enterprise, status: :created, location: @enterprise }
      else
        format.html { render action: 'new' }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end    
    rescue => e
      @enterprise = Enterprise.new(params[:enterprise].except(:plain_password))
      flash[:notice] = e.to_s
      render :new
    end
  end

  # PUT /enterprises/1
  def update
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      if @enterprise.update_attributes(params[:enterprise])
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
    
    rescue => e
      @enterprise = Enterprise.new(params[:enterprise].except(:plain_password))
      flash[:notice] = e.to_s
      render :edit
  end

  # DELETE /enterprises/1
  def destroy
    @enterprise = Enterprise.find(params[:id])
    @enterprise.destroy

    respond_to do |format|
      format.html { redirect_to enterprises_url }
      format.json { head :no_content }
    end
  end

  def image_title_ref
    'Enterprise Picture'
  end

  def load_enterprise
    @enterprises = Enterprise.all
  end
end