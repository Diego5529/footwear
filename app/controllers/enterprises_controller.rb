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

  def show
    @enterprise = Enterprise.find(params[:id])
  end

  def new
    @enterprise = Enterprise.new
  end

  def edit
    @enterprise = Enterprise.find(params[:id])
  end

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

  def destroy
    @enterprise = Enterprise.find(params[:id])
    @enterprise.destroy
  end

  def image_title_ref
    'Enterprise Picture'
  end

  def load_enterprise
    @enterprises = Enterprise.all
  end
end