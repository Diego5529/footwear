class OrderItem < ActiveRecord::Base
  attr_accessible :order_id,:client_id, :shoe_id, :enterprise_id, :value

  validates :shoe_id, :value, presence: true
  belongs_to :order
  belongs_to :shoe
  belongs_to :client

  scope :by_client, ->(id) { where(["client_id=?",id]) }
  scope :by_enterprise, ->(id) { where(["enterprise_id=?",id]) }
  
end