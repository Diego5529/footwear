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

  # #name
  # it "should not have empty name" do
  #   shoe = FactoryGirl.build(:shoe, name: '')
  #   shoe.should_not be_valid
  # end

  # it "should not have nil name" do
  #   shoe = FactoryGirl.build(:shoe, name: nil)
  #   shoe.should_not be_valid
  # end

  #  it "should be uniquennes name" do
  #   shoe = FactoryGirl.build(:shoe, name: "shoes.new_shoe")
  #   new_shoe = FactoryGirl.build(:shoe, name: "name")
  #   new_shoe.should_not be_valid if shoes.name == new_shoe.name
  # end
end