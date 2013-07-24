class EnterprisesController < ApplicationController
  # GET /enterprises
  # GET /enterprises.json
  def index
    @enterprises = Enterprise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enterprises }
    end
  end

  # GET /enterprises/1
  # GET /enterprises/1.json
  def show
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enterprise }
    end
  end

  # GET /enterprises/new
  # GET /enterprises/new.json
  def new
    @enterprise = Enterprise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enterprise }
    end
  end

  # GET /enterprises/1/edit
  def edit
    @enterprise = Enterprise.find(params[:id])
  end

  # POST /enterprises
  # POST /enterprises.json
  def create
    @enterprise = Enterprise.new(params[:enterprise])

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully created.' }
        format.json { render json: @enterprise, status: :created, location: @enterprise }
      else
        format.html { render action: "new" }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enterprises/1
  # PUT /enterprises/1.json
  def update
    @enterprise = Enterprise.find(params[:id])

    respond_to do |format|
      if @enterprise.update_attributes(params[:enterprise])
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enterprises/1
  # DELETE /enterprises/1.json
  def destroy
    @enterprise = Enterprise.find(params[:id])
    @enterprise.destroy

    respond_to do |format|
      format.html { redirect_to enterprises_url }
      format.json { head :no_content }
    end
  end
end
