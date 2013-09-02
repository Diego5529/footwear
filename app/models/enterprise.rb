# encoding: utf-8
require 'digest/sha1'
class Enterprise < ActiveRecord::Base
  include ImageSaver
  
  attr_protected :password
  attr_accessible :zip_code, :cnpj, :telephone, :address, :city, :district, :email, :name, :name_social, :number, :plain_password, :state, :data_stream, :permit
  
  #validates
  validates :name, presence: true,uniqueness: true, length: { maximum: 50 }, format: {with: /^[a-zA-ZçÇà-úÀ-Ú ]+$/}
  validates :name_social, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: {with:/^[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}$/}
  validates :password, presence: true, length: {maximum: 15}, length: {minimum: 5}
  validates :telephone, presence: true, allow_blank: true, allow_nil: true, length:{is: 11}
  validates :address, presence: true, length:{maximum: 200}
  validates :number, presence: true, length:{maximum: 5}
  validates :district, presence: true, length:{maximum: 50}
  validates :city, presence: true, length:{maximum: 100}
  validates :state, presence: true, length:{maximum: 50}
  validates :cnpj, presence: true, uniqueness: true, length:{is: 18}, format: {with:/^\d{2}.[\d]{3}.[\d]{3}\/[\d]{4}-[\d]{2}$/}
  validates :zip_code, presence: true, format:{with:/^[\d]{5}-[\d]{3}$/}
  validate :permit

  before_create :check_logo

  has_many :shoes, dependent: :destroy
  has_one  :image, dependent: :destroy, as: :imageable
  
  belongs_to :order

  def plain_password=(password)
    return if password.blank?
    raise StandardError.new('Tamanho de senha inválido!') if !(5..15).include?(password.size)
    self.password = self.class.encrypt_password(password)
  end

  def plain_password
    ''
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest("abc_#{password}_123")
  end

  def self.auth(email,password)
    where(['email=? and password=?',email,encrypt_password(password)]).first
  end

  def self.for_select
    self.all.map {|p| [p.name,p.id]}
  end
  
  private
  def check_logo
    errors.add(:data_stream,"deve ter logo") if self.data_stream.to_s.size<1
  end
end