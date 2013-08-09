class Order < ActiveRecord::Base
  attr_accessible :client_id
  has_many :order_items
  has_many :shoes, :through => :ordem_items
  belongs_to :clients
  has_many :enterprise


  def total
  	order_items.inject(0) {|m,i| m += i.value}
  end
end