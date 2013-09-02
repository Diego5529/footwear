# encoding: utf-8
class Shoe < ActiveRecord::Base
  include ImageSaver
  
  attr_protected :stock
  attr_accessible :audience, :permit, :description, :enterprise_id, :name, :registed, :value, :stock, :image_title, :data_stream
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :audience, presence: true, length: { maximum: 50 }
  validates :value, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :stock, presence: true, length:{maximum: 5}
  
  has_many :order_items
  has_many :orders, through: :order_items 
  has_many :clients, through: :orders, source: :person, uniq: true
  has_one  :image, dependent: :destroy, as: :imageable

  belongs_to :enterprise
  
  scope :by_enterprise, ->(id) { where(["enterprise_id=?",id]) }

  before_create :check_image

  def sold_out?
    self.stock < 1
  end

  def sell
    raise Exception, "Sold out" if sold_out?
    self.stock -= 1
    self.save!
  end

  private
  def check_image
    errors.add(:data_stream,"deve ter imagem") if self.data_stream.to_s.size<1
  end
end