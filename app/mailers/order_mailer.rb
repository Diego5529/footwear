class OrderMailer < ActionMailer::Base
  default from: "footwear@gmail.com"

  def order_created(order)
    @order = order
    mail(to: "diego.bootcamp@clickjogos.com.br", subject: "Pedido recebido!")
    #mail(to: order.enterprise.email, subject: "Pedido recebido!")
  end
end
