class RemovePermitToShoe < ActiveRecord::Migration
  
  def down
  	remove_column :shoes, :permit, :boolean
  end
end
