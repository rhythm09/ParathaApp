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

  def pending_orders
    @orders = Order.where(status: "pending")
  end

  def execute_order
    @id = params[:id];
    order = Order.find_by(id: params[:id])
    order.update(status: "executed")
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def generate_pdf
    @orders = Order.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Orders",
        page_size: 'A4',
        template: "orders/generate_pdf.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def process_payment
    
end

  def show_pdf_invoice
    byebug
   @id1=@id
    respond_to do |format|
      format.html { render :layout => false }
      format.pdf do
    render pdf: "show_pdf_invoice"
    #render :pdf => "pdf"#, :layout => 'pdf.html.erb'
      end
    end
  end

  def give_rating

    @order = Order.find_by(id: params[:id])
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def set_rating   
    @order=Order.find_by(id: params[:id])
    @order.update(rating: params[:rating1])
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  
  private

  def place_order(order)
    customer = Stripe::Customer.create email: params[:stripeEmail], card: params[:stripeToken]
    # Stripe::Charge.create customer: customer.id, amount: 500, description: 'hfh', currency: 'usd'
    if order.save
      @cart = current_user.cart
      @cart_parathas = @cart.cart_parathas
      @cart_parathas.each do |cart_paratha|
        @paratha = cart_paratha.paratha
        price = cart_paratha.quantity * @paratha.price
        order.order_parathas.create(paratha_id: @paratha.id, quantity: cart_paratha.quantity, price: price)
      end
      OrderMailerJob.perform_later order
      pending = "you have " + Order.count.to_s + "orders"
      @cart.cart_parathas.clear
      flash[:success] = "Order placed Successfully"
      ActionCable.server.broadcast("order_channel", pending)
    end
    redirect_to root_path
  end

  def calc_delivery_time
    Time.now + 2 * 60 *60
  end

  def address_params
    params.require(:address).permit(:address_line_1, :address_line_2, :city, :state)
  end


  # def stripe_params
  #     params.permit :stripeEmail, :stripeToken
  #   end

end
