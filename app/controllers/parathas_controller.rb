class ParathasController < ApplicationController
  before_action :find_paratha, only: %i(edit update destroy)

  def index
    @parathas = Paratha.all
  end

  def new
    @paratha = Paratha.new
  end

  def edit; end

  def create
    @paratha = Paratha.new(paratha_params)
    if @paratha.save
      flash[:success] = "Paratha Added Successfully"
      redirect_to root_path
    else
      render :new  
    end
  end

  def update
    if @paratha.update(paratha_params)
      flash[:success] = "Paratha Updated Successfully"
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    if @paratha.present?
      @paratha.destroy
      flash[:success] = "Paratha Deleted Successfully"
    else
      flash[:danger] = "Paratha Doesn't Exist"
    end
    redirect_to root_path
  end

  def delete_image
    @paratha = Paratha.find_by(id: params[:paratha_id])
    @image = @paratha.images.find_by(id: params[:image_id])
    @image.purge
    redirect_to edit_paratha_path(@paratha.id)
  end

  private

  def find_paratha
    @paratha = Paratha.find_by(id: params[:id])
  end

  def paratha_params
    params.require(:paratha).permit(:name, :price, :category, :description, images: [])
  end
end
