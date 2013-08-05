class Order < ActiveRecord::Base
  # attr_accessible :title, :body



  has_many :order_items

  def total
  	order_items.inject(0) {|m,i| m += i.value}
  end

  def clear
  	order_items
  end
end
