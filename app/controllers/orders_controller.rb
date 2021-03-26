class OrdersController < ApplicationController

  def show_addresses
    @addresses = current_user.addresses
  end

  def add_delivery_address
    @address = Address.new
  end

  def place_order_address

    @address = current_user.addresses.new(address_params)
    @address.save
    order = Order.new(address_id: @address.id, user_id: current_user.id)
    place_order(order)
  end

  def create
    order = Order.new(address_id: params[:id], user_id: current_user.id)
    place_order(order)
  end

  private

  def place_order(order)
    if order.save
      @cart = current_user.cart
      @cart_parathas = @cart.cart_parathas
      @cart_parathas.each do |cart_paratha|
        @paratha = Paratha.find_by(id: cart_paratha.paratha_id)
        price = cart_paratha.quantity * @paratha.price
        order.order_parathas.create(paratha_id: @paratha.id, quantity: cart_paratha.quantity, price: price)
        @cart.cart_parathas.clear
      end
      flash[:success] = "Order placed Successfully"
    else
      flash[:danger] = @order.errors.full_messages
    end
    redirect_to root_path
  end

  private

  def address_params
    params.require(:address).permit(:address_line_1, :address_line_2, :city, :state)
  end
end
