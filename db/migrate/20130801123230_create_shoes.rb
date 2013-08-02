class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :value, precision: 10, scale: 2
      t.decimal :promotion, precision: 10, scale: 2
      t.integer :enterprise_id
      t.string :audience
      t.integer :stock
      t.date :registed
      t.text :description

      t.timestamps
    end
  end
end
