class CartsController < ApplicationController
  before_action :find_cart
  protect_from_forgery except: :add
  before_action :find_cart_parathas, only: %i(add update destroy)

  def index
    @cart_parathas = CartParatha.where(cart_id: @cart.id)
  end

  def add
    @cart_paratha = @cart.cart_parathas.where(paratha_id: params[:id])
    if @cart_paratha.present?
      @cart_paratha.update(quantity: params[:quantity])
      respond_to do |format|  
        format.js  { render template: "carts/add" }
      end
    else
      @addcart = @cart.cart_parathas.build(paratha_id: params[:id], quantity: params[:quantity])
      if @addcart.save
        @count = @cart.cart_parathas.size
        respond_to do |format|  
          format.js  {render template: "carts/add"}
        end
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
    end 
  end

  def destroy
    @cart_detail = CartParatha.find_by(cart_id: @cart.id, paratha_id: params[:id])
    @id = @cart_detail.id
    if @cart_detail.present?
      @cart_detail.destroy
      respond_to do |format|
        format.js
      end
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

  def find_cart_parathas
    @cart_paratha = @cart.cart_parathas.find_by(paratha_id: params[:id])
  end
end
