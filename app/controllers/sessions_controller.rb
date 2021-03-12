class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      render "home/welcome"
    else 
      flash[:danger] = 'Invalid email and password'
      render :new
    end
  end

  def destroy
    session[:current_user_id]=nil
    flash[:notice] = 'Successfully Logged Out'
    redirect_to root_path
  end
end
