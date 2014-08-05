require 'spec_helper'

describe LoginController do

  #routes admin
  describe "routing" do
	it 'should have a login url' do
	  get("/login").should route_to("login#login")
	end

	it 'should have a logout url' do
	  get("/logout").should route_to("login#logout")
	end
  end
end