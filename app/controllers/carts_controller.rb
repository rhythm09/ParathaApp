class CartsController < ApplicationController
  before_action :find_cart
  protect_from_forgery except: :add

  def index
    @cart_parathas = CartParatha.where(cart_id: @cart.id)
  end

  def add
    @cart_paratha = @cart.cart_parathas.where(paratha_id: params[:id])
    if @cart_paratha.present?
      @cart_paratha.update(quantity: params[:quantity])
      respond_to do |format|  
          format.js  {render template: "carts/add"}
        end
    else
      @addcart = @cart.cart_parathas.build(paratha_id: params[:id], quantity: params[:quantity])
      if @addcart.save
        @count = @cart.cart_parathas.size
        respond_to do |format|  
          format.js  {render template: "carts/add"}
        end
      else 
        flash[:danger] = @addcart.errors.full_messages
        redirect_to root_path
      end
    end
  end

  def update
    @cart_detail = CartParatha.find_by(cart_id: @cart.id, paratha_id: params[:id])
    @id = @cart_detail.id
    if @cart_detail.update(quantity: params[:quantity])
      flash[:success] = "Cart Updated Successfully"
      respond_to do |format|
        format.js
      end
    else 
      flash[:danger] = @cart_detail.errors.full_messages
      redirect_to carts_path
    end 
  end

  def destroy
    @cart_detail = CartParatha.find_by(cart_id: @cart.id, paratha_id: params[:id])
    @id = @cart_detail.id
    if @cart_detail.present?
      @cart_detail.destroy
      flash[:success] = "Paratha Deleted Successfully from cart"
    else
      flash[:danger] = "Paratha Doesn't Exist"
    end
    respond_to do |format|
      format.js
    end
  end

  def update_quantity
    @paratha = Paratha.find_by(id: params[:id])
    @cart_detail = CartParatha.find_by(cart_id: @cart.id, paratha_id: params[:id])
    @id = @cart_detail.id
    respond_to do |format|
      format.js
    end
  end

  private

  def find_cart
  @cart = current_user.cart
  end
end
