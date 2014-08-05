require 'spec_helper'

describe LoginController do

  it 'should get login' do
    get :login
    response.should be_successful
  end

  it "should not login without name and password" do
    post :login
    flash[:notice].should eql "Digite o nome e senha"
  end

  it "should not login without password" do
    post :login, {name: "Administrador"}
    flash[:notice].should eql "Digite a senha"
  end

  it "should not login without name" do
    post :login, {password:"XXX"}
    flash[:notice].should eql "Digite o nome"
  end

  it "should not login with invalid password" do
    person = FactoryGirl.build(:person)
    post :login, {name: person.name, password:"invalid"}
    flash[:notice].should eql "Falha no login"
  end

  it "should not login with invalid name" do
    post :login, {name: "Administrador", password: "123456"}
    flash[:notice].should eql "Falha no login"
  end

  context "admin login" do
    it "should login with valid information" do
      person = FactoryGirl.create(:person, plain_password: "123456", admin: true)
      post :login, { name: person.name, password: "123456" }
      session[:id].should eql person.id
      session[:name].should eql person.name
      session[:admin].should eql person.admin?
    end
  end

  it "should logout" do
    get :logout
    session[:id].should eql nil
    session[:name].should eql nil
    session[:admin].should eql nil
    redirect_to login_path
  end

end