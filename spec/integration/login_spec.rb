# encoding: utf-8
require 'spec_helper'

describe 'login' do

   # it 'should not login with wrong pass' do
   #    person = FactoryGirl.create(:person)
   #    visit login_path
   #    #fill_in 'name', with: person.name
   #    #fill_in 'password', with: '123456'
   #    #click_button 'Entrar'
   #    expect(page).to have_text("Login:")
   #  end

  # it 'should not login with wrong pass', js: :true do
  #   person = create(:person)
  #   visit login_path
  #   p "=========================================="
  #   #p (page).to have_text("Failed Login")
  #   p page.current_path
  #   # print page.html
  #   # page.save_screenshot('screenshot.png')
  #   fill_in "name", with: person.name
  #   fill_in "password", with: '123456'
  #   #click_link 'Administrador'
  #   expect(page).to have_text("Login")
  #   # p all('label')
  #   click_button 'Entrar'
  #   p page.current_path
  # end


  # it 'should not login with wrong name' do
  #   person = create(:person)
  #   visit login_path
  #   fill_in 'name', with: 'Login:'
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