class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :authenticate
    
    def authenticate
      user_token = bearer_token
      if user_token
        # puts user_token
        @user = User.find_by_token(user_token)
        # puts @user.id
        return unauthorize if @user.nil?
      else
        return unauthorize
      end
    end

    private

    def bearer_token
      pattern = /^Bearer /
      header  = request.headers['Authorization']
      header.gsub(pattern, '') if header && header.match(pattern)
    end

    def unauthorize
      render json: "User unauthorized"
      # head :unauthorized
      return false
    end
  end
