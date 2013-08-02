# encoding: utf-8
class Shoe < ActiveRecord::Base
	include ImageSaver
  
  attr_protected :stock
  attr_accessible :audience, :description, :enterprise_id, :name, :promotion, :registed, :value, :stock, :image_title, :data_stream
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :audience, presence: true, length: { maximum: 50 }
  validates :value, presence: true
  
  belongs_to :enterprise 
  
  has_one  :image, :as => :imageable

  scope :by_enterprise, ->(id) { where(["enterprise_id=?",id]) }

   def sold_out?
   	self.stock < 1
	end
end
