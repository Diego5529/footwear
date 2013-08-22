require 'spec_helper'

describe 'Client' do

  describe 'login_client' do

  it 'should not login with wrong pass' do
    client = FactoryGirl.create(:client)
    visit login_client_path
    fill_in 'email', with: client.email
    fill_in 'password', with: '12'
    click_button 'Entrar'
    expect(page).to have_text("Falha no login")
  end

  it 'should not login with blank pass' do
    client = FactoryGirl.create(:client)
    visit login_client_path
    fill_in 'email', with: client.email
    fill_in 'password', with: ''
    click_button 'Entrar'
    expect(page).to have_text("Digite a senha")
  end

  it 'should not login with blank email' do
    client = FactoryGirl.create(:client)
    visit login_client_path
    fill_in 'email', with: ''
    fill_in 'password', with: client.password
    click_button 'Entrar'
    expect(page).to have_text("Digite o e-mail")
  end

  it 'should not login with blank email and password' do
    client = FactoryGirl.create(:client)
    visit login_client_path
    fill_in 'email', with: ''
    fill_in 'password', with: ''
    click_button 'Entrar'
    expect(page).to have_text("Digite o e-mail e senha")
  end

  it 'should not login with wrong email' do
    client = create(:client)
    visit login_client_path
    fill_in 'email', with: 'foo@'
    fill_in 'password', with: client.password
    click_button 'Entrar'
    expect(page).to have_text("Falha no login")
  end

  it 'should login' do
    client = FactoryGirl.create(:client)
    visit login_client_path
    fill_in 'email', with: client.email
    fill_in 'password', with: client.password
    click_button 'Entrar'
    redirect_to '/cart'
  end
end
end