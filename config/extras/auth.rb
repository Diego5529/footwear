# encoding: utf-8

module Auth
  module ClassMethods
    def encrypt_password(password)
      Digest::SHA1.hexdigest("abc_#{password}_123")
    end

    def auth(email,password)
      where(['email=? and password=?',email,encrypt_password(password)]).first
    end
  end

  def self.included(where)
    where.attr_protected :password
    where.attr_accessible :password
    where.attr_accessible :plain_password
    where.validates :password, presence: true, length: {maximum: 15}, length: {minimum: 5}
    where.extend(ClassMethods)
  end

  def plain_password=(password)
    return if password.blank?
    raise StandardError.new('Tamanho de senha inválido!') if !(5..15).include?(password.size)
    self.password = self.class.encrypt_password(password)
  end

  def plain_password
    ''
  end
end
