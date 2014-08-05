class OrderItem < ActiveRecord::Base
  attr_accessible :client_id, :shoe_id, :enterprise_id,:order_id, :value

  validates :shoe_id, :value, presence: true
  belongs_to :order
  belongs_to :shoe
  belongs_to :client
  belongs_to :enterprise

  scope :by_client, ->(id) { where(["client_id=?",id]) }
  scope :by_enterprise, ->(id) { where(["enterprise_id=?",id]) }
  
  def grouped_by_enterprise
  	shoes.map(&:enterprise).map(&:email).uniq
  end

  def total
  	shoes.map(&:value).sum
  end
end