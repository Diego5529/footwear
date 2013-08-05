# encoding: utf-8
require 'spec_helper'

describe Client do
  
    # #Enteclientrprise create?
    # let(:client) do
    #     client = FactoryGirl.create(:client)
    #  end

    it "should has a client" do
       client = FactoryGirl.create(:client).should be_valid
    end
    
    #NAME
    it "should not have a blank name" do
      client = FactoryGirl.build(:client, name: '').should_not be_valid
    end

    it "should not have nil name" do
    client = FactoryGirl.build(:client, name: nil)
    client.should_not be_valid
  end

  #EMAIL 
  it "should not have empty email" do
    client = FactoryGirl.build(:client, email: '')
    client.should_not be_valid
  end

  it "should not have nil email" do
    client = FactoryGirl.build(:client, email: nil)
    client.should_not be_valid
  end

  it "email should match the regex" do
    client = FactoryGirl.build(:client, email: 'foo@bar.com')
    client.email.should match(/^[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}$/)
  end

  it "should be uniquennes email" do
    user = FactoryGirl.build(:client, email: "foo@bar.newuser")
    new_client = FactoryGirl.build(:client, email: "foo@bar.com")
    new_client.should_not be_valid if user.email == new_client.email
  end 
  
   #PASSWORD
    it "should not have a blank name" do
      client = FactoryGirl.build(:client, password:'')
      client.should_not be_valid
    end

    it "should not have nil password" do
    client = FactoryGirl.build(:client, password: nil)
    client.should_not be_valid
   end

   it "must return the correct encrypted password" do
    client = FactoryGirl.build(:client, password: Digest::SHA1.hexdigest('abc_123456_123'))
    pass = Enterprise.encrypt_password('123456')
    client.password.should eq pass
  end

  it "must get the password plain text" do
    client = FactoryGirl.build(:client)
    client.should respond_to :plain_password=
  end

  it "should have attribute to return empty password" do
     FactoryGirl.build(:client, plain_password: '').should be_valid
  end

  it "should save the encrypt password in password" do
    client = FactoryGirl.build(:client, plain_password: '123456')
    client.password.should eq Client.encrypt_password('123456')
  end

  #state
  it "should not have empty state" do
    client = FactoryGirl.build(:client, state: '')
    client.should_not be_valid
  end

  it "should not have nil state" do
    client = FactoryGirl.build(:client, state: nil)
    client.should_not be_valid
  end

  #city
  it "should not have empty city" do
    client = FactoryGirl.build(:client, city: '')
    client.should_not be_valid
  end


  it "should not have nil city" do
    client = FactoryGirl.build(:client, city: nil)
    client.should_not be_valid
  end  

  #address
   it 'address should be up to 200 caracters' do
    FactoryGirl.build(:client, address: '').should_not be_valid
    FactoryGirl.build(:client, address: 'X' * 201).should_not be_valid
    FactoryGirl.build(:client, address: 'X' * 200).should be_valid
    FactoryGirl.build(:client, address: nil).should_not be_valid
  end

  #number
  it "could have empty number" do
    client = FactoryGirl.build(:client, number: '')
    client.should_not be_valid
  end

  it "could have nil number" do
    client = FactoryGirl.build(:client, number: nil)
    client.should_not be_valid
  end

   #district
  it "should not have empty district" do
    client = FactoryGirl.build(:client, district: '')
    client.should_not be_valid
  end


  it "should not have nil district" do
    client = FactoryGirl.build(:client, district: nil)
    client.should_not be_valid
  end  

  #telephone
  it "could have empty telephone" do
    client = FactoryGirl.build(:client, telephone: '')
    client.should be_valid
  end

  it "could have nil telephone" do
    client = FactoryGirl.build(:client, telephone: nil)
    client.should be_valid
  end

  it "telephone should has 11 caracters" do
   FactoryGirl.build(:client, telephone: 'X'*10).should_not be_valid
   FactoryGirl.build(:client, telephone: 'X'*12).should_not be_valid
   FactoryGirl.build(:client, telephone: 'X'*11).should be_valid
  end

  #CPF
  it "should not have empty cnpj" do
    client = FactoryGirl.build(:client, cpf: '')
    client.should_not be_valid
  end

  it "should not have nil cnpj" do
    client = FactoryGirl.build(:client, cpf: nil)
    client.should_not be_valid
  end

  it "cnpj should has certify caracters" do
    FactoryGirl.build(:client, cpf: '123.456.789-XX').should be_valid
  end

  #zip_code
  it "should not have empty zip_code" do
    client = FactoryGirl.build(:client, zip_code: '')
    client.should_not be_valid
  end

  it "should not have nil zip_code" do
    client = FactoryGirl.build(:client, zip_code: nil)
    client.should_not be_valid
  end

end