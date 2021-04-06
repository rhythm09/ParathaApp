class OrdersController < ApplicationController

  def index 
    @orders = current_user.orders
  end

  def place_order_address
    @address = current_user.addresses.new(address_params)
    @address.save
    delivery_time = calc_delivery_time
    order = Order.new(address_id: @address.id, user_id: current_user.id, delivery_time: delivery_time)
    place_order(order)
  end

  def create
    delivery_time = calc_delivery_time
    order = Order.new(address_id: params[:id], user_id: current_user.id, delivery_time: delivery_time)
    place_order(order)
  end

  private

  def place_order(order)
    if order.save
      @cart = current_user.cart
      @cart_parathas = @cart.cart_parathas
      @cart_parathas.each do |cart_paratha|
        @paratha = cart_paratha.paratha
        price = cart_paratha.quantity * @paratha.price
        order.order_parathas.create(paratha_id: @paratha.id, quantity: cart_paratha.quantity, price: price)
      end
      OrderMailerJob.perform_later order
      @cart.cart_parathas.clear
      flash[:success] = "Order placed Successfully"
    end
    redirect_to root_path
  end

  def calc_delivery_time
    Time.now + 2 * 60 *60
  end

  def address_params
    params.require(:address).permit(:address_line_1, :address_line_2, :city, :state)
  end
end
