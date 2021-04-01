class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit update)
  
  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path 
    else
      render :new
    end
  end
 
  def update
    if @user.update(user_params)
      flash[:success] = "Updated Successfully"
      redirect_to root_path
    else 
      render :edit
    end
  end

  private
  
  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_confirmation, :password, :gender, :image)
  end
end
