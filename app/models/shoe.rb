# encoding: utf-8
class Shoe < ActiveRecord::Base
  include ImageSaver
  
  attr_protected :stock
  attr_accessible :category_id, :permit, :description, :enterprise_id, :name, :registed, :value, :stock, :image_title, :data_stream, :lock_version
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :category_id, presence: true
  validates :value, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :stock, presence: true, length:{maximum: 5}
  validate :lock_version

  has_many :orders, through: :order_items
  has_many :clients, through: :orders, source: :person, uniq: true
  has_one :image, dependent: :destroy, as: :imageable

  belongs_to :enterprise
  belongs_to :category
  has_many :client
  
  scope :by_enterprise, ->(id) { where(["enterprise_id=?",id]) }
  scope :by_category, ->(id) { where(["category_id=?",id]) }
  
  scope :permited, -> { where(permit: true) }

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