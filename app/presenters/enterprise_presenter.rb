# encoding: utf-8
class EnterprisePresenter
  attr_reader :enterprise

  def initialize(enterprise)
    @enterprise = enterprise
  end
  
  def permit
    @enterprise.permit ? "Sim" : "Não"
  end
end