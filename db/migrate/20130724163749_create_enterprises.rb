class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :name_social
      t.string :email
      t.string :password
      t.string :cnpj
      t.string :zip_code, :limit=>9, :null=>false
      t.string :address
      t.string :number
      t.string :district
      t.string :state
      t.string :city
      t.string :telephone

      t.timestamps
    end
  end
end
