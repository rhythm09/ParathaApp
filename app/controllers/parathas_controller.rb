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

  def index
    @parathas = Paratha.all
  end

  def edit
    @paratha = Paratha.find_by(id: params[:id])
  end

  def update
    @paratha = Paratha.find_by(id: params[:id])
    if @paratha.update(paratha_params)
      flash[:success] = "Updated Successfully"
      redirect_to root_path
    else 
      flash.now[:danger] = @paratha.errors.full_messages
      render :edit
    end
  end

  def paratha_params
    params.require(:paratha).permit(:name, :price, :category, :description)
  end
end
