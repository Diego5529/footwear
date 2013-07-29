class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :cpf
      t.string :zip_code
      t.string :address
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :telephone

      t.timestamps
    end
  end
end
