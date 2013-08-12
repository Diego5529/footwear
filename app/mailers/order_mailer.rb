# encoding: utf-8
class OrderMailer < ActionMailer::Base
  default from: "footwear@gmail.com"

  def order_created(order,email)
    @order = order
    @email = email
    #@email_enterprises = email_enterprises
    mail(to: @email, subject: "Pedido recebido!")
    #mail(to: order.enterprise.email, subject: "Pedido recebido!")
  end
end
