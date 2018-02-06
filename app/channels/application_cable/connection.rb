module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # user_token = bearer_token
      # if user_token
      params = request.query_parameters()
      # puts params
      token = params["token"]
      self.current_user = find_verified_user token
    end

    private

    def find_verified_user token
      # if verified_user = User.find_by_token('17xCzprsnRk5aUF6cHNrqtzK')
      if verified_user = User.find_by(token: token)
        # puts verified_user
        # @userType = "known"
        verified_user

      # else
        # @userType = "unknown"

        # reject_unauthorized_connection
      end
    end

    def bearer_token
      pattern = /^Bearer /
      header  = request.headers['Authorization']
      header.gsub(pattern, '') if header && header.match(pattern)
    end

  end
end
