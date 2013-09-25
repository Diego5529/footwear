shoes_category = ['Dockside']

enterprise = [
	['Metropolitan', 'Mussum','diego@gmail.com','123456','11.111.111/1311-13','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',true],
	['Metropolitan2', 'Mussum2','diego2@gmail.com','123456','11.111.111/1311-15','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',true]
]

shoes = [
	['Metropolitan', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, shoes_category[0],'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',enterprise[0],true],
	['New', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, shoes_category[0],'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',enterprise[0],true],
	['other', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, shoes_category[0],'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',enterprise[0],true],
	['Metropolitan2', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, shoes_category[0],'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',enterprise[0],true],
	['Metroo', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, shoes_category[0],'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',enterprise[0],true]
]

enterprise.each do |name,name_social, email, password, cnpj, zip_code, address, number, district, state, city, telephone, image ,permit|
  Enterprise.create(name:name,name_social:name_social,email:email,password:password,cnpj:cnpj,zip_code:zip_code,address:address,number:number,district:district,state:state,city:city,telephone:telephone,image_title:image,permit:permit)
end

shoes.each do |name, stock, description, value, date,category,image,enterprise,permit|
	Shoe.create(name:name, stock: stock, description: description, value: value, registed: date, category_id: category, image_title:image, enterprise_id: enterprise,permit:permit)  
end

#Mayor.create(name: 'Emanuel', city: cities.first)