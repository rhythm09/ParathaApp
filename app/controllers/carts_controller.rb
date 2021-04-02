class CartsController < ApplicationController
  before_action :find_cart
  before_action :find_cart_parathas, only: %i(add update destroy)

  def index
    @cart_parathas = CartParatha.where(cart_id: @cart.id)
  end

  def add
    if @cart_paratha.present?
      @cart_paratha.update(quantity: params[:quantity])
      redirect_to root_path
    else
      @cart_paratha = @cart.cart_parathas.build(paratha_id: params[:id], quantity: params[:quantity])
      if @cart_paratha.save
        flash[:success] = "Cart Added Successfully" 
        redirect_to root_path
      end
    end
  end

  def update
    if @cart_paratha.update(quantity: params[:quantity])
      flash[:success] = "Cart Updated Successfully"
      redirect_to carts_path
    end 
  end

  def destroy
    if @cart_paratha.present?
      @cart_paratha.destroy
      flash[:success] = "Paratha Deleted Successfully from cart"
    else
      flash[:danger] = "Paratha Doesn't Exist"
    end
    redirect_to carts_path
  end

  def find_cart
    @cart = current_user.cart
  end

  def find_cart_parathas
    @cart_paratha = @cart.cart_parathas.find_by(paratha_id: params[:id])
  end
end
