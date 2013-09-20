class AddcolumnsToOrders < ActiveRecord::Migration
  def up
  	add_column :order_items,:client_id, :integer
  	add_column :order_items,:enterprise_id, :integer
  end
end
