class OrderMailer < ApplicationMailer
  def created(order)
    attachments.inline['logo.png'] = logo

    @order = order

    mail to: @order.person.email, subject: "Pedido #{@order.id} recebido!"
  end

  def logo
    File.read("#{Rails.root}/app/assets/images/logo.png")
  end
end
