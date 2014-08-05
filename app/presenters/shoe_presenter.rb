# encoding: utf-8
class ShoePresenter
  attr_reader :shoe

  def initialize(shoe)
    @shoe = shoe
  end
  
  def permit
    @shoe.permit ? "Sim" : "Não"
  end
end