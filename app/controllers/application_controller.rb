class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    if  @current_user.nil?
      @current_user = User.find_by(id: session[:current_user_id])
    else
      @current_user 
    end
  end  
 

  def logged_in?
    current_user.present?  
  end
end


