require 'spec_helper'

describe "PasswordResets" do 
	it "email user when requesting password reset"
		user = Factory(:user)
		visit login_path
		click_link 'password'
		fil_in 'Email', :with => user.Email
		click_button 'Reset Password'
	end
end