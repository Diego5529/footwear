# encoding: utf-8

class Person < ActiveRecord::Base
  include Auth
  attr_accessible :admin, :name

  validates :name, presence: true,uniqueness: true, length: { maximum: 50 }
  validate :admin

  scope :admins, -> { where(['admin=?',true]) }
  scope :by_domain, ->(domain) { where(['name like ?','#{domain}']) }

  default_scope -> { order(:name) }

  def self.auth(name,password)
    where(['name=? and password=?',name,encrypt_password(password)]).first
  end
end
