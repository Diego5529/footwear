# people = [
#   ['Diego','123456',true],
#   ['administrador','1234567',true]
# ]

# people.each do |name,password,admin|
#     Person.create(name:name,password:password,admin:admin)
#  end

# category = [
#   ['Infantil'],
#   ['Adulto'],
#   ['Masculino'],
#   ['Feminino'],
#   ['Esporte']
# ]


enterprises = [
  ['Klin', 'klin','diego.6.souza@gmail.com','123456','13.111.111/1311-17','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','../images/enterprises/51.jpg',true],
  ['Adidas', 'Adidas','diego2@gmail.com','123456','12.111.111/1311-43','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','../images/enterprises/51.jpg',true],
  ['Puma', 'puma','diego3@gmail.com','123456','12.111.111/1311-54','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','../images/enterprises/51.jpg',true],
  ['Kidy', 'Kidy','diego4@gmail.com','123456','12.111.111/1311-45','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','../images/enterprises/51.jpg',true]
]

# shoes = [
#   ['Nike', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,49,13,true]
#   ['New Shoe', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',31,true],
#   ['other', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',32,true],
#   ['Metropolitan2', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',21,true],
#   ['Metroo', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',31,true]
# ]


# client = [
#   ['Cliente1','client1@email.com','1234567','444.143509-92','16200-000','address','Rua de tal','1200','centro','Rio de Janeiro','Rio de Janeiro','01836412478'],
#   ['Cliente2','client2@email.com','123456','444.143509-23','16200-000','address','Rua de tal','1200','centro','Rio de Janeiro','Rio de Janeiro','01836412478']
# ]

# client.each do |name,email,password,cpf,zip_code,address,number,district,city,state,telephone|
# 	Client.create(name:name,email:email,password:password,cpf:cpf,zip_code:zip_code,address:address,number:number,district:district,city:city,state:state,telephone:telephone)
# end

enterprises.each do |name,name_social, email, password, cnpj, zip_code, address, number, district, state, city, telephone, image ,permit|
  Enterprise.create(name:name,name_social:name_social,email:email,password:password,cnpj:cnpj,zip_code:zip_code,address:address,number:number,district:district,state:state,city:city,telephone:telephone,image_title:image,permit:permit)
end

# category.each do |name|
#   Category.create(name:name)
# end

# shoes.each do |name, stock, description, value, date,category,image,enterprise,permit|
#   Shoe.create(name:name, stock: stock, description: description, value: value, registed: date, category_id: category, image_title:image, enterprise_id: enterprise,permit:permit)  
# end