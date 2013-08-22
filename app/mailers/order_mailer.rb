# encoding: utf-8
class OrderMailer < ActionMailer::Base
  default from: 'footwear@gmail.com'

  def order_created(order,email)
    @order = order
    @email = email
    mail(to: @email, subject: 'Pedido recebido!')
    
  end

  def enterprise_order_created(email,items)
  	@items = items
  	mail(to: email, subject: 'Encomenda para sua empresa!' )
  end

end
