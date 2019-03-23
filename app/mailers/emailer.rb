class Emailer < ApplicationMailer

  def order_receipt order
    @order = order
    mail(to: order.email, subject: 'Order Receipt')
  end
end
