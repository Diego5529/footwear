class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :value, precision: 10, scale: 2
      t.integer :enterprise_id
      t.integer :category_id
      t.date :registed
      t.text :description
      t.integer :stock, :integer
      t.boolean :permit, :boolean
      t.integer :lock_version, default: 0

      t.timestamps
    end
  end
end
