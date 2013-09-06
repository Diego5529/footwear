class LoginException < StandardError; end

class LoginParms
  def self.check_by_email(email,pwd)
    check(email,pwd)
  end

  def self.check_by_name(name,pwd)
    check(name,pwd,"nome")
  end

  private
  def self.check(ref,pwd,text="e-mail") 
    raise LoginException.new("Digite o #{text} e senha") if ref.blank? && pwd.blank?
    raise LoginException.new("Digite o #{text}")         if ref.blank?
    raise LoginException.new("Digite a senha")           if pwd.blank?
  end
end
