require 'spec_helper'

describe Enterprise do
  
  let(:enterprise) do
    enterprise = FactoryGirl.create(:enterprise)
   end

 #NAME
  it "should not have a blank name" do
    enterprise = FactoryGirl.build(:enterprise, name: '')
    enterprise.should_not be_valid
  end
  
  # #PASSWORD
  # it "should not have a blank name" do
  #   enterprise = FactoryGirl.build(:enterprise, password:'')
  #   enterprise.should_not be_valid
   end
end