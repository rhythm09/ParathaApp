class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path 
    else
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = "Updated Successfully"
      redirect_to root_path
    else 
      flash.now[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_confirmation, :password, :gender)
  end
end
