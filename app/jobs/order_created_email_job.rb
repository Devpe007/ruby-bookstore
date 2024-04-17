class OrderCreatedEmailJob < ApplicationJob
  queue_as :default

  def perform(id)
    OrderMailer.created(id).deliver_now

    OrdersChannel.broadcast_to(order, msg: 'Email de confirmação enviado!')
  end
end
