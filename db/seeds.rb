category = ['Esporte']

category.each do |name|
	Category.create(name:name)
end



enterprise = [
	['Penalty', 'Penalty','diego5@gmail.com','123456','11.111.111/1311-17','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','../images/enterprises/51.jpg',true],
	['Nike', 'Nike','diego3@gmail.com','12346','11.111.111/1311-34','16200-000','Rua','1233','Centro','SP','Birigui','01897748585','../images/enterprises/51.jpg',true]
]

shoes = [
	['Nike', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',33,true],
	['New Shoe', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',31,true]
	['other', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',32,true],
	['Metropolitan2', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'http://imagens.passarela.com.br/passarelaEstatico/imagens/produto/8030087467/8030087467_1_Z.JPG',21,true],
	['Metroo', 5, 'Mussum ipsum cacilds, vidis litro abertis.', 170.00, DateTime.now, 6,'../images/enterprises/51.jpg',31,true]
]

enterprise.each do |name,name_social, email, password, cnpj, zip_code, address, number, district, state, city, telephone, image ,permit|
  Enterprise.create(name:name,name_social:name_social,email:email,password:password,cnpj:cnpj,zip_code:zip_code,address:address,number:number,district:district,state:state,city:city,telephone:telephone,image_title:image,permit:permit)
end

shoes.each do |name, stock, description, value, date,category,image,enterprise,permit|
	Shoe.create(name:name, stock: stock, description: description, value: value, registed: date, category_id: category, image_title:image, enterprise_id: enterprise,permit:permit)  
end