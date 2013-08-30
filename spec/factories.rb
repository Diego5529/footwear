FactoryGirl.define do 
  
  factory :person do
    name 'Administrador'
    password '123456'
    admin true
   end
   
  factory :enterprise do
    name 'Empresa'
    name_social 'Nome Social'
    email 'foo@bar.com'
    password '123456'
    zip_code '16200-000'
    address 'rua ssss, 885'
    number '1332'
    district 'Centro'
    state 'Rio de Janeiro'
    city 'Birigui'
    telephone '01897748686'
    cnpj '13.456.789/8745-66'
  end

  factory :client do
    name 'Usuario'
    email 'foo@bar.com'
    password '123456'
    zip_code '16200-000'
    address 'Rua ssss'
    number '1332'
    district 'Centro'
    state 'Rio de Janeiro'
    city 'Birigui'
    telephone '01897748686'
    cpf '445.153.509-83'
  end

  factory :shoe do
    name 'Name'
    value 9.99
    audience 'Infantil'
    stock 10
    description 'Text decription'
    enterprise_id 1
   end

  factory :order_item do
    shoe_id 1
    value 9.99
  end

end