class OrderMailerJob < ApplicationJob
  queue_as :default

  def perform(order)
    UserMailer.with(order: order).place_order.deliver_later
  end
end
