# encoding: utf-8
require "digest/sha1"

class Person < ActiveRecord::Base

	attr_protected :password
  attr_accessible :admin, :name, :plain_password

  validates :name, presence: true,uniqueness: true, length: { maximum: 50 }
  validates :password, presence: true, length: {maximum: 15}, length: {minimum: 5}
  validate :admin

  scope :admins, -> { where(["admin=?",true]) }
  scope :by_domain, ->(domain) { where(["name like ?","#{domain}"]) }

  default_scope -> { order(:name) }
 

  def plain_password=(password)
    return if password.blank?
    raise StandardError.new("Tamanho de senha inválido!") if !(5..15).include?(password.size)
    self.password = self.class.encrypt_password(password)
  end

  def plain_password
    ""
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest("abc_#{password}_123")
  end

  def self.auth(name,password)
  where(["name=? and password=?",name,encrypt_password(password)]).first
  end
end
