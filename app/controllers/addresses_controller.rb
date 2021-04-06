class AddressesController < ApplicationController
  before_action :find_address, only: %i(edit update destroy)

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.new
  end

  def edit; end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      flash[:success] = "Address Added Successfully"
      redirect_to root_path 
    else
      render :new
    end 
  end

  def update
    if @address.present?
      if @address.update(address_params)
        flash[:success] = "Address Updated Successfully"
        redirect_to root_path
      else 
        render :edit
      end
    else 
      flash[:danger] = "Address is missing"
    end
  end


  def destroy
    @id = params[:id]
    @address.destroy
    flash[:success] = "Address Deleted Successfully"
    respond_to do |format|  
      format.js { render layout: false }   
    end    
  end

  def show_addresses
    @addresses = current_user.addresses
  end

  def add_delivery_address
    @address = Address.new
    respond_to do |format|
      format.js { render layout: false } 
    end
  end 

  private

  def find_address
    @address = current_user.addresses.find_by(id: params[:id])
  end

  def address_params
    params.require(:address).permit(:address_line_1, :address_line_2, :city, :state)
  end
end
