require 'spec_helper'

describe LoginClientController do

  it 'should get login_client' do
    get :login_client
    response.should be_success
  end

  it "should not login_client without email and password" do
    post :login_client
    flash[:notice].should eql "Enter the email and password"
  end

  it "should not login_client without password" do
    post :login_client, {email: "foo@bar.com"}
    flash[:notice].should eql "Enter the password"
  end

  it "should not login_client without email" do
    post :login_client, {password:"XXX"}
    flash[:notice].should eql "Enter the email"
  end

  it "should not login_client with invalid password" do
    client = FactoryGirl.build(:client)
    post :login_client, {email: client.email, password:"invalid"}
    flash[:notice].should eql "Failed Login"
  end

  it "should not login_client with invalid email" do
    post :login_client, {email: "foo@bar.com", password: "123456"}
    flash[:notice].should eql "Failed Login"
  end

  context "when permit" do
    it "should login_client with valid information" do
      client = FactoryGirl.create(:client, plain_password: "123456")
      post :login_client, { email: client.email, password: "123456" }
      session[:id].should eql client.id
      session[:email].should eql client.email
    end
  end

  # context "when not client" do
  #   it "should login_client with valid information" do
  #     client = FactoryGirl.create(:client, plain_password: "123456")
  #     match :login_client, { email: client.email, password: "123456" }
  #     session[:id].should eql client.id
  #     session[:name].should eql client.name
  #     response.should redirect_to login_client
  #   end
  # end

  it "should logout" do
    get :logout_client
    session[:id].should eql nil
    session[:name].should eql nil
    redirect_to "/"
  end
end