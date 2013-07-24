class Enterprise < ActiveRecord::Base
  attr_accessible :CEP, :CNPJ, :telephone, :address, :city, :district, :email, :name, :name_social, :number, :password, :state
end
