class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
    	
      t.references :shoe
      t.decimal :value, precision: 10, scale:2
      t.integer :enterprise_id
      t.integer :client_id

      t.timestamps
    end
  end
end
