# encoding: utf-8
require "digest/sha1"

class Person < ActiveRecord::Base

	attr_protected :password
  attr_accessible :admin, :name, :plain_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: {maximum: 10}, length: {minimum: 5}
  validates :admin, presence: true

  	
#scope :admins, -> { where(["admin=?",true]) }


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
end
