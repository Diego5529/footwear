class AddPolymorphismToImage < ActiveRecord::Migration
  def up
  	old_imgs = Image.all.inject({}) {|memo,img| memo[img.id] = img.enterprise_id; memo }

  	remove_column :images, :enterprise_id
  	add_column	  :images, :imageable_id,:integer
  	add_column	  :images, :imageable_type, :string

  	Image.reset_column_information

  	old_imgs.each do |id,enterprise_id|
  		next if enterprise_id.blank?
  		puts "updating image #{id} with Enterprise #{enterprise_id}"
  		Image.find(id).update_attributes(imageable_id: enterprise_id, imageable_type: "Enterprise")
  		end
  	end

  	def down
  		add_column :images, :enterprise_id, :integer
  		remove_column :images, :imageable_id
  		remove_column :images, :imageable_type
  	end
end
