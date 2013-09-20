class Order < ActiveRecord::Base
  attr_accessible :client_id
  has_many :order_items
  has_many :shoes, through: :ordem_items
  belongs_to :client
  has_one :client, dependent: :destroy
  has_many :enterprises

  def grouped_by_enterprise
    order_items.inject({}) {|memo,item| memo[item.shoe.enterprise.email] ||= []; memo[item.shoe.enterprise.email] << item; memo}
  end

  def total
    order_items.inject(0) {|m,i| m += i.value}
  end
end
