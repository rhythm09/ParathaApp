class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :logged_in?, :is_admin?
  
  # def current_user
  #   @current_user ||= User.find_by(id: session[:current_user_id])
  # end
 
  def logged_in?
    current_user.present?  
  end

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender])
  end

  def is_admin?
    current_user.role.eql?("admin")
  end
end
