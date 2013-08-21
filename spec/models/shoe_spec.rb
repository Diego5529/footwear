# encoding: utf-8
require 'spec_helper'

describe Shoe do

  let(:shoe) do
     shoe = FactoryGirl.create(:shoe)
  end

  # #Shoe create ?
  # it "should has a shoe" do
  #    shoe = FactoryGirl.create(:shoe)
  #    shoe.should be_valid
  # end

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

  # it 'value should not be zero' do
  #   FactoryGirl.build(:shoe, value: 0).should_not be_valid
  #   FactoryGirl.build(:shoe, value: 1).should be_valid
  #   FactoryGirl.build(:shoe, value: nil).should_not be_valid
  # end

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
end