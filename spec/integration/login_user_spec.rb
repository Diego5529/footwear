require 'spec_helper'

describe 'Enterprise' do

  describe 'login_user' do

    it 'should not login with wrong pass' do
      enterprise = FactoryGirl.create(:enterprise)
      visit login_user_path
      fill_in 'email', with: enterprise.email
      fill_in 'password', with: '12'
      click_button 'Entrar'
      expect(page).to have_text("Falha no login")
    end

    it 'should not login with wrong pass' do
      enterprise = FactoryGirl.create(:enterprise)
      visit login_user_path
      fill_in 'email', with: enterprise.email
      fill_in 'password', with: ''
      click_button 'Entrar'
      expect(page).to have_text("Digite a senha")
    end

    it 'should not login with wrong pass' do
      enterprise = FactoryGirl.create(:enterprise)
      visit login_user_path
      fill_in 'email', with: ''
      fill_in 'password', with: enterprise.password
      click_button 'Entrar'
      expect(page).to have_text("Digite o e-mail")
    end

    it 'should not login with wrong pass' do
      enterprise = FactoryGirl.create(:enterprise)
      visit login_user_path
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      click_button 'Entrar'
      expect(page).to have_text("Digite o e-mail e senha")
    end

    it 'should not login with wrong email' do
      enterprise = create(:enterprise)
      visit login_user_path
      fill_in 'email', with: 'foo@'
      fill_in 'password', with: enterprise.password
      click_button 'Entrar'
      expect(page).to have_text("Falha no login")
    end

    it 'should login' do
      enterprise = FactoryGirl.create(:enterprise)
      visit login_user_path
      fill_in 'email', with: enterprise.email
      fill_in 'password', with: '123456'
      click_button 'Entrar'
    end
  end
end
