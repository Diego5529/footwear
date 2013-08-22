require 'spec_helper'

describe LoginUserController do

  #routes enterprises
  describe "routing login enterprise" do
	it 'should have a login_user url' do
	  get("/login_user").should route_to("login_user#login_user")
	end

	it 'should have a logout_user url' do
	  get("/logout_user").should route_to("login_user#logout_user")
	end
  end
end