class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :shoe_id, :value

  validates :shoe_id, :value, presence: true
  belongs_to :order
  belongs_to :shoe
end