require 'spec_helper'


describe PublicsController do

  describe 'routing' do
    it 'should have cart' do
      post('/cart').should route_to('publics#cart')
    end

    it 'should have register client' do
      get('register').should route_to('publics#buyers')
    end

    it 'should have register enterprise' do
      get('register_enterprise').should route_to('publics#sellers')
    end 

    it 'should have shoe' do
      get('shoe/14').should route_to('publics#shoe',id:'14')
    end

    it 'should have register enterprise' do
      get('enterprise/4').should route_to('publics#enterprise',id:'4')
    end

    it 'should have buy' do
      post('buy/1').should route_to('publics#buy',id:'1')
    end

    it 'should have remove' do
      delete('remove/1').should route_to('publics#remove',id:'1')
    end

    it 'should have close_order' do
      post('/checkout').should route_to('publics#close_order')
    end

    it 'should have edit_enterprise' do
      post('/edit_enterprise').should route_to('publics#edit_enterprise')
    end

    it 'should have edit_client' do
      post('/edit_client').should route_to('publics#edit_client')
    end

    it 'should have confirm request' do
      post('/request/1').should route_to('publics#order',id:'1')
    end
  end
end