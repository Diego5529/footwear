require 'spec_helper'


describe PublicsController do

  describe "routing" do
    it 'should have cart' do
      post("/cart").should route_to("publics#cart")
    end

    it 'should have register client' do
      get("register").should route_to("publics#buyers")
    end

    it 'should have register enterprise' do
      get("register_enterprise").should route_to("publics#sellers")
    end 

    # it 'should have buy' do
    #   get("cart/buy").should route_to("publics#buy")
    # end 

    it 'should have close_order' do
      post("/checkout").should route_to("publics#close_order")
    end

    # it 'should have confirm request' do
    #   post("/request/1").should route_to("publics#order")
    # end
end

end