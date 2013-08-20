require 'spec_helper'

describe 'Person' do

  describe 'login' do

    # it 'should not login with wrong pass' do
    #   person = FactoryGirl.create(:person)
    #   visit "/login/login"
    #   p "=========================================="
    #   #p (page).to have_text("Failed Login")
    #   fill_in "name", with: person.name
    #   fill_in "password", with: '12345'
    #   click_button 'Entrar'
    #   expect(page).to have_text("Failed Login")
    # end

    # it 'should not login with wrong name' do
    #   person = FactoryGirl.create(:person)
    #   visit login_path
    #   fill_in 'name', with: 'Name'
    #   fill_in 'password', with: person.password
    #   click_button 'Entrar'
    #   expect(page).to have_text("Failed Login")
    # end

    # it 'should login' do
    #   person = FactoryGirl.create(:person)
    #   visit login_path
    #   fill_in 'name', with: person.name
    #   fill_in 'password', with: person.password
    #   click_button 'Entrar'
    # end

  end
end