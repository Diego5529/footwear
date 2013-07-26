# encoding: utf-8
require "digest/sha1"

class Enterprise < ActiveRecord::Base
  
  attr_protected :password
  attr_accessible :zip_code, :cnpj, :telephone, :address, :city, :district, :email, :name, :name_social, :number, :plain_password, :state
  
  validates :name, presence: true,uniqueness: true, length: { maximum: 50 }
  validates :name_social, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: {with:/^[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}$/}
  validates :password, presence: true, length: {maximum: 10}, length: {minimum: 6}
  validates :telephone, allow_blank: true, allow_nil: true, length:{is: 11}
  validates :address, presence: true, length:{maximum: 200}
  validates :number, presence: true, length:{maximum: 5}
  validates :district, presence: true, length:{maximum: 50}
  validates :city, presence: true, length:{maximum: 100}
  validates :state, presence: true, length:{maximum: 50}
  validates :cnpj, presence: true, uniqueness: true, length:{is: 14}
  validates :zip_code, presence: true, format:{with:/^[\d]{5}-[\d]{3}$/}
  
  def plain_password=(password)
    return if password.blank?
    self.password = self.class.encrypt_password(password)
  end

  def plain_password
    ""
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest("abc_#{password}_123")
  end

  def self.auth(email,password)
    where(["email=? and password=?",email,encrypt_password(password)]).first
  end

end
