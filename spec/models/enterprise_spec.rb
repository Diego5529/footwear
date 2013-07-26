require 'spec_helper'

describe Enterprise do
  
    #Enterprise create?
    let(:enterprise) do
        enterprise = FactoryGirl.create(:enterprise)
     end

    # it "should has a enterprise" do
    #    enterprise = FactoryGirl.create(:enterprise)
    #    enterprise.should be_valid
    # end

    
    #NAME
    it "should not have a blank name" do
      enterprise = FactoryGirl.build(:enterprise, name: '')
      enterprise.should_not be_valid
    end

    it "should not have nil name" do
    enterprise = FactoryGirl.build(:enterprise, name: nil)
    enterprise.should_not be_valid
  end

  it "should be uniquennes name" do
    enterprise = FactoryGirl.build(:enterprise, name: "admin.new_enterprise")
    new_enterprise = FactoryGirl.build(:enterprise, name: "admin")
    new_enterprise.should_not be_valid if enterprise.name == new_enterprise.name
  end

  #SOCIAL_NAME
    it "should not have a blank name_social" do
      enterprise = FactoryGirl.build(:enterprise, name_social: '')
      enterprise.should_not be_valid
    end

    it "should not have nil name_social" do
    enterprise = FactoryGirl.build(:enterprise, name_social: nil)
    enterprise.should_not be_valid
  end

  it "should be uniquennes name_social" do
    enterprise = FactoryGirl.build(:enterprise, name_social: "admin.new_enterprise")
    new_enterprise = FactoryGirl.build(:enterprise, name_social: "admin")
    new_enterprise.should_not be_valid if enterprise.name_social == new_enterprise.name
  end

  #EMAIL 
  it "should not have empty email" do
    enterprise = FactoryGirl.build(:enterprise, email: '')
    enterprise.should_not be_valid
  end

  it "should not have nil email" do
    enterprise = FactoryGirl.build(:enterprise, email: nil)
    enterprise.should_not be_valid
  end

  it "email should match the regex" do
    enterprise = FactoryGirl.build(:enterprise, email: 'foo@bar.com')
    enterprise.email.should match(/^[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}$/)
  end

  it "should be uniquennes email" do
    user = FactoryGirl.build(:enterprise, email: "foo@bar.newuser")
    new_user = FactoryGirl.build(:enterprise, email: "foo@bar.com")
    new_user.should_not be_valid if user.email == new_user.email
  end 
  
   #PASSWORD
    it "should not have a blank name" do
      enterprise = FactoryGirl.build(:enterprise, password:'')
      enterprise.should_not be_valid
    end

    it "should not have nil password" do
    enterprise = FactoryGirl.build(:enterprise, password: nil)
    enterprise.should_not be_valid
   end

   it "must return the correct encrypted password" do
    enterprise = FactoryGirl.build(:enterprise, password: Digest::SHA1.hexdigest('abc_123456_123'))
    pass = Enterprise.encrypt_password('123456')
    enterprise.password.should eq pass
  end

  it "must get the password plain text" do
    enterprise = FactoryGirl.build(:enterprise)
    enterprise.should respond_to :plain_password=
  end

  it "should have attribute to return empty password" do
     FactoryGirl.build(:enterprise, plain_password: '').should be_valid
  end

  it "should save the encrypt password in password" do
    enterprise = FactoryGirl.build(:enterprise, plain_password: '123456')
    enterprise.password.should eq Enterprise.encrypt_password('123456')
  end

  #state
  it "should not have empty state" do
    enterprise = FactoryGirl.build(:enterprise, state: '')
    enterprise.should_not be_valid
  end

  it "should not have nil state" do
    enterprise = FactoryGirl.build(:enterprise, state: nil)
    enterprise.should_not be_valid
  end

  #city
  it "should not have empty city" do
    enterprise = FactoryGirl.build(:enterprise, city: '')
    enterprise.should_not be_valid
  end


  it "should not have nil city" do
    enterprise = FactoryGirl.build(:enterprise, city: nil)
    enterprise.should_not be_valid
  end  

  #address
   it 'address should be up to 200 caracters' do
    FactoryGirl.build(:enterprise, address: '').should_not be_valid
    FactoryGirl.build(:enterprise, address: 'X' * 201).should_not be_valid
    FactoryGirl.build(:enterprise, address: 'X' * 200).should be_valid
    FactoryGirl.build(:enterprise, address: nil).should_not be_valid
  end

  #number
  it "could have empty number" do
    enterprise = FactoryGirl.build(:enterprise, number: '')
    enterprise.should_not be_valid
  end

  it "could have nil number" do
    enterprise = FactoryGirl.build(:enterprise, number: nil)
    enterprise.should_not be_valid
  end

   #district
  it "should not have empty district" do
    enterprise = FactoryGirl.build(:enterprise, district: '')
    enterprise.should_not be_valid
  end


  it "should not have nil district" do
    enterprise = FactoryGirl.build(:enterprise, district: nil)
    enterprise.should_not be_valid
  end  

  #telephone
  it "could have empty telephone" do
    enterprise = FactoryGirl.build(:enterprise, telephone: '')
    enterprise.should be_valid
  end

  it "could have nil telephone" do
    enterprise = FactoryGirl.build(:enterprise, telephone: nil)
    enterprise.should be_valid
  end

  it "telephone should has 11 caracters" do
   FactoryGirl.build(:enterprise, telephone: 'X'*10).should_not be_valid
   FactoryGirl.build(:enterprise, telephone: 'X'*12).should_not be_valid
   FactoryGirl.build(:enterprise, telephone: 'X'*11).should be_valid
  end

  #cnpj
  it "should not have empty cnpj" do
    enterprise = FactoryGirl.build(:enterprise, cnpj: '')
    enterprise.should_not be_valid
  end

  it "should not have nil cnpj" do
    enterprise = FactoryGirl.build(:enterprise, cnpj: nil)
    enterprise.should_not be_valid
  end

  it "cnpj should has certify caracters" do
  # FactoryGirl.build(:enterprise, cnpj: 'X'*17).should_not be_valid
    FactoryGirl.build(:enterprise, cnpj: '011.111.111/1111-11').should_not be_valid
    FactoryGirl.build(:enterprise, cnpj: '13.456.789/8745-66').should be_valid
  end

  #zip_code
  it "should not have empty zip_code" do
    enterprise = FactoryGirl.build(:enterprise, zip_code: '')
    enterprise.should_not be_valid
  end

  it "should not have nil zip_code" do
    enterprise = FactoryGirl.build(:enterprise, zip_code: nil)
    enterprise.should_not be_valid
  end

end