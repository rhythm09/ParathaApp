class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user&.authenticate(login_params[:password])
      session[:current_user_id] = @user.id
      redirect_to welcome_path 
    else 
      flash[:danger] = 'Invalid email and password'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:Successfully] = 'Successfully Logged Out'
    redirect_to root_path
  end

  private 
  def login_params
    params.require(:session).permit(:email, :password)
  end
end
  
