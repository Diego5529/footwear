# encoding: utf-8
require 'spec_helper'

describe Shoe do

  let(:shoe) do
     shoe = FactoryGirl.create(:shoe)
  end

  #name
  it "should not have empty name" do
    shoe = FactoryGirl.build(:shoe, name: '')
    shoe.should_not be_valid
  end

  it "should not have nil name" do
    shoe = FactoryGirl.build(:shoe, name: nil)
    shoe.should_not be_valid
  end

   it "should be uniquennes name" do
    shoe = FactoryGirl.build(:shoe, name: "shoe.new_shoe")
    new_shoe = FactoryGirl.build(:shoe, name: "name")
    new_shoe.should_not be_valid if shoe.name == new_shoe.name
  end

  #value
  it "should not have empty value" do
    shoe = FactoryGirl.build(:shoe, value: '')
    shoe.should_not be_valid
  end

  it "should not have nil value" do
    shoe = FactoryGirl.build(:shoe, value: nil)
    shoe.should_not be_valid
  end

  #stock
  it "should not have empty stock" do
    shoe = FactoryGirl.build(:shoe, stock: '')
    shoe.should_not be_valid
  end

  it "should not have nil stock" do
    shoe = FactoryGirl.build(:shoe, stock: nil)
    shoe.should_not be_valid
  end

  #audience
  it "should not have empty audience" do
    shoe = FactoryGirl.build(:shoe, audience: '')
    shoe.should_not be_valid
  end

  it "should not have nil audience" do
    shoe = FactoryGirl.build(:shoe, audience: nil)
    shoe.should_not be_valid
  end

  #description
  it "should not have empty description" do
    shoe = FactoryGirl.build(:shoe, description: '')
    shoe.should_not be_valid
  end

  it "should not have nil description" do
    shoe = FactoryGirl.build(:shoe, description: nil)
    shoe.should_not be_valid
  end

  context "permited" do
    it "should have a scope to filter" do
      Shoe.should respond_to :permited
    end

    it "should return empty when not permited doesn't exists" do
      FactoryGirl.create(:shoe)
      Shoe.permited.size.should == 0
    end

    it "should return shows when permited" do
      FactoryGirl.create(:shoe, permit: true)
      Shoe.permited.size.should == 1
    end
  end
end
