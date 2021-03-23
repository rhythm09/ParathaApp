class ParathasController < ApplicationController
  before_action :find_paratha, only: %i(edit update destroy)

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

  def edit; end

  def update
    if @paratha.update(paratha_params)
      flash[:success] = "Paratha Updated Successfully"
      redirect_to root_path
    else 
      flash.now[:danger] = @paratha.errors.full_messages
      render :edit
    end
  end

  def destroy
    @paratha.destroy
    flash[:success] = "Paratha Deleted Successfully"
    redirect_to root_path
  end

  private

  def find_paratha
    @paratha = Paratha.find_by(id: params[:id])
  end

  def paratha_params
    params.require(:paratha).permit(:name, :price, :category, :description)
  end
end
