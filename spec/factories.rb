FactoryGirl.define do 
  
  factory :person do
    admin true
    name 'Administrador'
    plain_password '123456'
   end
   
  factory :enterprise do
    address 'rua ssss, 885'
    city 'Birigui'
    cnpj '13.456.789/8745-66'
    district 'Centro'
    email 'foo@bar.com'
    name 'Empresa'
    name_social 'Nome Social'
    number '1332'
    plain_password '123456'
    state 'Rio de Janeiro'
    telephone '01897748686'
    zip_code '16200-000'
  end

  factory :client do
    address 'Rua ssss'
    city 'Birigui'
    cpf '445.153.509-83'
    district 'Centro'
    email 'foo@bar.com'
    name 'Usuario'
    number '1332'
    plain_password '123456'
    state 'Rio de Janeiro'
    telephone '01897748686'
    zip_code '16200-000'
  end

  factory :shoe do
    audience 'Infantil'
    description 'Text decription'
    enterprise_id 1
    name 'Name'
    stock 10
    value 9.99
   end

  factory :order_item do
    shoe_id 1
    value 9.99
  end
end