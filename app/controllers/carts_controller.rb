class CartsController < ApplicationController
  before_action :find_cart

  def index
    @cart_parathas = CartParatha.where(cart_id: @cart.id)
  end

  def add
    @cart_paratha = @cart.cart_parathas.where(paratha_id: params[:id])
    if @cart_paratha.present?
      @cart_paratha.update(quantity: params[:quantity])
      redirect_to root_path
    else
      @addcart = @cart.cart_parathas.build(paratha_id: params[:id], quantity: params[:quantity])
      if @addcart.save
        redirect_to root_path
      else 
        flash[:danger] = @addcart.errors.full_messages
        redirect_to root_path
      end
    end
  end

  def update
    @cart_detail = CartParatha.find_by(cart_id: @cart.id, paratha_id: params[:id])
    if @cart_detail.update(quantity: params[:quantity])
      flash[:success] = "Cart Updated Successfully"
      redirect_to carts_path
    else 
      flash[:danger] = @cart_detail.errors.full_messages
      redirect_to carts_path
    end 
  end

  def destroy
    @cart_detail = CartParatha.find_by(cart_id: @cart.id, paratha_id: params[:id])
    if @cart_detail.present?
      @cart_detail.destroy
      flash[:success] = "Paratha Deleted Successfully from cart"
    else
      flash[:danger] = "Paratha Doesn't Exist"
    end
    redirect_to carts_path
  end

  def find_cart
  @cart = current_user.cart
  end
end
