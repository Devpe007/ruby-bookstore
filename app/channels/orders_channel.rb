class OrdersChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.info "Subscribed to the orders channel, order #{params[:id]}"

    stream_from Order.find(params[:id]);
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
