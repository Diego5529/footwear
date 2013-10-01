#encoding: utf-8
class PeopleController < ApplicationController

  respond_to :html
  #before_filter :logged?
  layout "admin"

  # def logged?
  #   redirect_to "/login" if !session[:admin]
  # end

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def orders
    @orders = OrderItem.order("created_at DESC").all
  end

  def orderdetails
    @orders = OrderItem.find(params[:id])
  end

  def create

    begin
      @person = Person.new(params[:person])
      respond_to do |format|
        if @person.save
          format.html { redirect_to @person, notice: 'Pessoa criada.' }
          format.json { render json: @person, status: :created, location: @person }
        else
          format.html { render action: "new" }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
    rescue => e
      @person = Person.new
      flash[:notice] = e.to_s
      render :new
    end
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Pessoa atualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  rescue => e
    @person = Person.new(params[:person].except(:plain_password))
    flash[:notice] = e.to_s
    render :edit
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
end