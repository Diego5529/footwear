class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :shoes

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }

end