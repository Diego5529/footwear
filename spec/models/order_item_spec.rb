# encoding: utf-8
require 'spec_helper'

describe OrderItem do

  let(:order_item) do
    order_item = FactoryGirl.create(:order_item)
  end

  #value
  it "should not have empty value" do
    order_item = FactoryGirl.build(:order_item, value: '')
    order_item.should_not be_valid
  end

  it "should not have nil value" do
    order_item = FactoryGirl.build(:order_item, value: nil)
    order_item.should_not be_valid
  end

  #shoe_id
  it "should not have empty shoe_id" do
    order_item = FactoryGirl.build(:order_item, shoe_id: '')
    order_item.should_not be_valid
  end

  it "should not have nil shoe_id" do
    order_item = FactoryGirl.build(:order_item, shoe_id: nil)
    order_item.should_not be_valid
  end
end