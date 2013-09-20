class RenameaudiencetocategoryId < ActiveRecord::Migration
	def change
	  change_table :shoes do |t|
	    t.rename :audience, :category_id
	end
  end
end
