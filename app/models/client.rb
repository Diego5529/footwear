# encoding: utf-8
class Client < ActiveRecord::Base
  include Auth

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  attr_accessible :address, :city, :district, :email, :name, :number, :state, :telephone, :zip_code, :cpf
  
  #validates
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: {with:/^[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}$/}
  validates :telephone, presence: true, allow_blank: true, allow_nil: true, length:{is: 11}
  validates :address, presence: true, length:{maximum: 200}
  validates :number, presence: true, length:{maximum: 5}
  validates :district, presence: true, length:{maximum: 50}
  validates :city, presence: true, length:{maximum: 100}
  validates :state, presence: true, length:{maximum: 50}
  validates :cpf, presence: true, uniqueness: true, length:{is: 14}, format: {with:/^\d{3}.[\d]{3}.[\d]{3}-[\w]{2}$/}
  validates :zip_code, presence: true, format:{with:/^[\d]{5}-[\d]{3}$/}
end