class Order < ActiveRecord::Base
  attr_accessible :client_id
  has_many :order_items, dependent: :destroy
  has_many :shoes, through: :ordem_items
  belongs_to :client
  has_one :client, dependent: :destroy
  has_many :enterprises

  def grouped_by_enterprise
    #shoes.map(&:enterprise).map(&:email).uniq
    order_items.inject({}) {|memo,item| memo[item.shoe.enterprise.email] ||= []; memo[item.shoe.enterprise.email] << item; memo}
  end

  def total
    #shoes.map(&:value).sum
    order_items.inject(0) {|m,i| m += i.value}
  end
end
