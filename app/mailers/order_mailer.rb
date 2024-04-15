class OrderMailer < ApplicationMailer
  def created(id)
    attachments.inline['logo.png'] = logo

    @order = Order.find(id)

    mail to: @order.person.email, subject: "Pedido #{@order.id} recebido!"
  end

  def logo
    File.read("#{Rails.root}/app/assets/images/logo.png")
  end
end
