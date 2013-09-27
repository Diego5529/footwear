class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :value, precision: 10, scale: 2
      t.integer :enterprise_id
      t.integer :category_id
      t.date :registed
      t.text :description

      t.timestamps
    end
  end
end
