# encoding: utf-8
class Shoe < ActiveRecord::Base
	include ImageSaver
  
  attr_accessible :audience, :description, :enterprise_id, :name, :promotion, :registed, :stock, :value
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :audience, presence: true, length: { maximum: 50 }
  validates :value, presence: true
  
  belongs_to :enterprise 
  
  has_one  :image, :as => :imageable
end
