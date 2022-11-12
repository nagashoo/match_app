module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      reject_unauthorized_connection unless find_varified_trainer
    end

    private

    def find_varified_trainer
      self.current_user = env['warden'].user
    end

  end
end
