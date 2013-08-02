class AddStockToShoe < ActiveRecord::Migration
	def up
		add_column :shoes, :stock, :integer
		Shoe.reset_column_information
		Shoe.update_all(stock: 1)
	end
		
	def down
		remove_column :shoes, :stock
	end
end
