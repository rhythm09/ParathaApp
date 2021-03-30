class AddressesController < ApplicationController
  before_action :find_address, only: %i(edit update destroy)

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def edit; end

  def update
    if @address.update(address_params)
      flash[:success] = "Address Updated Successfully"
      redirect_to root_path
    else 
      flash.now[:danger] = @address.errors.full_messages
      render :edit
    end
  end

  def destroy
    @id1 = params[:id]
    @address.destroy
    flash[:success] = "Address Deleted Successfully"
    respond_to do |format|  
      format.js   
    end    
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      flash[:success] = "Address Added Successfully"
      redirect_to root_path 
    else
      flash.now[:danger] = @address.errors.full_messages
      render :new
    end 
  end

  private

  def find_address
    @address = Address.find_by(id: params[:id])
  end

  def address_params
    params.require(:address).permit(:address_line_1, :address_line_2, :city, :state)
  end
end
