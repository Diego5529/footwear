FactoryGirl.define do 
  factory :person do
    name 'Diego'
    #email 'treicyfelton@msn.com'
    #nick 'treicy'
    password '123456' 
    #born_at '2013-05-04'
    #situation 'on'
    #hobby 'sei la'
    admin true
   end
   
   factory :enterprise do
    name 'Empresa'
    name_social 'Nome Social'
    email 'foo@bar.com'
    password '123456'
    # cnpj '123456789102345'
    # zip_code '16200-000'
    address 'rua ssss, 885'
    # number '1332'
    district 'Centro'
    state 'Rio de Janeiro'
    # city 'Birigui'
    telephone '12345698745'
   end
end