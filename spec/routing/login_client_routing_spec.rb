require 'spec_helper'

describe LoginClientController do

  #routes clients
  describe "routing login enterprise" do
	it 'should have a login_client url' do
	  get("/login_client").should route_to("login_client#login_client")
	end

	it 'should have a logout_client url' do
	  get("/logout_client").should route_to("login_client#logout_client")
	end
  end
end