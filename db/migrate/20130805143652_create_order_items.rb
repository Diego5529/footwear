class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
    	
      t.references :shoe
      t.decimal :value, precision: 10, scale:2

      t.timestamps
    end
  end
end
