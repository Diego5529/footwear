# encoding: utf-8
require 'spec_helper'

describe Category do

  let(:category) do
     category = FactoryGirl.create(:category)
  end

  #name
  it "should not have empty name" do
    category = FactoryGirl.build(:category, name: '')
    category.should_not be_valid
  end

  it "should not have nil name" do
    category = FactoryGirl.build(:category, name: nil)
    category.should_not be_valid
  end

   it "should be uniquennes name" do
    category = FactoryGirl.build(:category, name: "category.new_category")
    new_category = FactoryGirl.build(:category, name: "name")
    new_category.should_not be_valid if category.name == new_category.name
  end
end