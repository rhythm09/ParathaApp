class CartsController < ApplicationController
  before_action :find_cart
  before_action :find_cart_parathas, only: %i(add update destroy update_quantity)

  def index
    @cart_parathas = CartParatha.where(cart_id: @cart.id)
  end

  def add
    if @cart_paratha.present?
      @cart_paratha.update(quantity: params[:quantity])
    else
      @addcart = @cart.cart_parathas.build(paratha_id: params[:id], quantity: params[:quantity])
      if @addcart.save
        @count = @cart.cart_parathas.size
      end
    end
    respond_to do |format|  
      format.js { render layout: false }
    end
  end

  def update
    @id = @cart_paratha.id
    if @cart_paratha.update(quantity: params[:quantity])
      flash[:success] = "Cart Updated Successfully"
      respond_to do |format|
        format.js { render layout: false } 
      end
    end 
  end

  def destroy
    @id = @cart_paratha.id
    if @cart_paratha.present?
      @cart_paratha.destroy
      respond_to do |format|
        format.js { render layout: false } 
      end
    end
  end

  def update_quantity
    @paratha = Paratha.find_by(id: params[:id])
    @id = @cart_paratha.id
    respond_to do |format|
      format.js { render layout: false } 
    end
  end

  private

  def find_cart
    @cart = current_user.cart
  end

  def find_cart_parathas
    @cart_paratha = @cart.cart_parathas.find_by(paratha_id: params[:id])
  end

end
