require 'spec_helper'

describe LoginUserController do

  it 'should get login_user' do
    get :login_user
    response.should be_success
  end

  it "should not login_user without email and password" do
    post :login_user
    flash[:notice].should eql "Enter the email and password"
  end

  it "should not login_user without password" do
    post :login_user, {email: "foo@bar.com"}
    flash[:notice].should eql "Enter the password"
  end

  it "should not login_user without email" do
    post :login_user, {password:"XXX"}
    flash[:notice].should eql "Enter the email"
  end

  it "should not login_user with invalid password" do
    enterprise = FactoryGirl.build(:enterprise)
    post :login_user, {email: enterprise.email, password:"invalid"}
    flash[:notice].should eql "Failed Login"
  end

  it "should not login_user with invalid email" do
    post :login_user, {email: "foo@bar.com", password: "123456"}
    flash[:notice].should eql "Failed Login"
  end

  context "when permit" do
    it "should login_user with valid information" do
      enterprise = FactoryGirl.create(:enterprise, plain_password: "123456")
      post :login_user, { email: enterprise.email, password: "123456" }
      session[:id].should eql enterprise.id
      session[:name].should eql enterprise.name
    end
  end

  it "should logout" do
    get :logout_user
    session[:id].should eql nil
    session[:name].should eql nil
    redirect_to "/"
  end
end