class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :is_admin
  
  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
 
  def logged_in?
    current_user.present?  
  end

  def is_admin
    current_user.role.eql?("admin")
  end
end
