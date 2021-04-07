module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      # logger.add_tags 'ActionCable', current_user.studentid
    end

    private

    def find_verified_user
      if verified_user = env['warden'].user
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
