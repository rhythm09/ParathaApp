module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        session = @request.session
        if verified_user = User.find_by(id: session[:current_user_id])
          if verified_user.role.eql?("admin")
            verified_user
          else 
          reject_unauthorized_connection
          end
        else
          reject_unauthorized_connection
        end
      end
  end
end
