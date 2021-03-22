class ParathasController < ApplicationController
  
  def new
    @paratha = Paratha.new
  end

  def create
    @paratha = Paratha.new(paratha_params)
    if @paratha.save
      flash[:success] = "Paratha Added Successfully"
      redirect_to root_path
    else
      flash.now[:danger] = @paratha.errors.full_messages
      render :new  
    end
  end

  def show
  end

  def paratha_params
    params.require(:paratha).permit(:name, :price, :category, :description)
  end
end
