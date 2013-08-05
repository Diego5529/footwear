class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :shoe_id
      t.decimal :value, precision: 10, scale:2

      t.timestamps
    end
  end
end
