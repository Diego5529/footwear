class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :limit=>50, :null=>false
      t.string :email, :limit=>100
      t.string :password, :limit=>50
      t.boolean :admin

      t.timestamps
    end
  end
end
