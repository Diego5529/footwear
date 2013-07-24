class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name, :limit=>50, :null=>false
      t.string :name_social
      t.string :email, :limit=>50, :null=>false
      t.string :password, :limit=>50, :null=>false
      t.string :CNPJ, :limit=>14, :null=>false
      t.string :CEP, :limit=>8, :null=>false
      t.string :address, :limit=>50, :null=>false
      t.string :number, :limit=>10, :null=>false
      t.string :district, :limit=>50, :null=>false
      t.string :state, :limit=>50, :null=>false
      t.string :city, :limit=>50, :null=>false
      t.string :telephone, :limit=>20, :null=>false

      t.timestamps
    end
  end
end
