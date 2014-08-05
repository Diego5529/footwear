# encoding: utf-8
require 'spec_helper'

describe Person do

  let(:person) do
     person = FactoryGirl.create(:person)
  end

  #Person create ?
  it "should has a person" do
     person = FactoryGirl.create(:person)
     person.should be_valid
  end

  #Name
  it "should not have empty name" do
    person = FactoryGirl.build(:person, name: '')
    person.should_not be_valid
  end

  it "should not have nil name" do
    person = FactoryGirl.build(:person, name: nil)
    person.should_not be_valid
  end

   it "should be uniquennes name" do
    person = FactoryGirl.build(:person, name: "admin.new_person")
    new_person = FactoryGirl.build(:person, name: "admin")
    new_person.should_not be_valid if person.name == new_person.name
  end 

   #PASSWORD
  it "should not have a blank password" do
     person = FactoryGirl.build(:person, password: '')
     person.should_not be_valid
  end

  it "should not a nil password" do
      person = FactoryGirl.build(:person, password: nil)
      person.should_not be_valid
  end

  #tests for secure password
  it "must return the correct encrypted password" do
    person = FactoryGirl.build(:person, password: Digest::SHA1.hexdigest('abc_123456_123'))
    pass = Person.encrypt_password('123456')
    person.password.should eq pass
  end

  it "must get the password plain text" do
    person = FactoryGirl.build(:person)
    person.should respond_to :plain_password=
  end

  it "should have attribute to return empty password" do
    FactoryGirl.build(:person, plain_password: '').should_not be_valid
  end

  it "should have attribute to return empty password" do
    FactoryGirl.build(:person, plain_password: nil).should_not be_valid
  end

  it "should save the encrypt password in password" do
    person = FactoryGirl.build(:person, plain_password: '123456')
    person.password.should eq Person.encrypt_password('123456')
  end
end