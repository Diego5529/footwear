# encoding: utf-8
class Person < ActiveRecord::Base
  attr_accessible :admin, :name, :password

  validates :name, presence: true, length: { maximum: 50 }
  
end
