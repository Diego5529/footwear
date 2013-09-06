# encoding: utf-8
require 'spec_helper'

describe 'login' do
  
  it 'should not login with wrong pass' do
    person = FactoryGirl.create(:person)
    visit login_path
    fill_in 'name', with: person.name
    fill_in 'password', with: '12'
    click_button 'Entrar'
    expect(page).to have_text("Falha no login")
  end

  it 'should not login with blank pass' do
    person = FactoryGirl.create(:person)
    visit login_path
    fill_in 'name', with: person.name
    fill_in 'password', with: ''
    click_button 'Entrar'
    expect(page).to have_text("Digite a senha")
  end

  it 'should not login with blank name' do
    person = FactoryGirl.create(:person)
    visit login_path
    fill_in 'name', with: ''
    fill_in 'password', with: person.password
    click_button 'Entrar'
    expect(page).to have_text("Digite o nome")
  end

  it 'should not login with blank name and password' do
    person = FactoryGirl.create(:person)
    visit login_path
    fill_in 'name', with: ''
    fill_in 'password', with: ''
    click_button 'Entrar'
    expect(page).to have_text("Digite o nome e senha")
  end

  it 'should not login with wrong name' do
    person = create(:person)
    visit login_path
    fill_in 'name', with: 'Login'
    fill_in 'password', with: '123456'
    click_button 'Entrar'
    expect(page).to have_text("Falha no login")
  end

  it 'should login' do
    person = FactoryGirl.create(:person)
    visit login_path
    fill_in 'name', with: person.name
    fill_in 'password', with: '123456'
    click_button 'Entrar'
  end

  it 'should login' do
    person = create(:person)
    visit login_path
    fill_in 'name', with: 'Administrador'
    fill_in 'password', with: '123456'
    click_button 'Entrar'
  end
end
