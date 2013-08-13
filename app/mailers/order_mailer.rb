# encoding: utf-8
class OrderMailer < ActionMailer::Base
  default from: "footwear@gmail.com"

  def order_created(order,email)
    @order = order
    @email = email
    mail(to: @email, subject: "Order received!")
    
  end

  def enterprise_order_created(email,items)
  	@items = items
  	mail(to: email, subject: "You received a request" )
  end

end
