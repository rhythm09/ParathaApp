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
    @user = find_user
  end

  def edit
    @user = find_user
  end
  
  def update
    @user = find_user
    if @user.update(user_params)
      flash[:success] = "Updated Successfully"
      redirect_to root_path
    else 
      flash.now[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_confirmation, :password, :gender)
  end
end
