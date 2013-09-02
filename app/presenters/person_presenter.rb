# encoding: utf-8
class PersonPresenter
  attr_reader :person

  def initialize(person)
    @person = person
  end
  
  def admin
    @person.admin ? "Sim" : "Não"
  end
  
  def password
    "*"*10
  end
end