class BaseController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    before_action :authenticate

    def authenticate
      user_token = request.headers['X-USER-TOKEN']
      if user_token
        puts user_token
        @user = User.find_by_token(user_token)
        puts @user.id
        return unauthorize if @user.nil?
      else
        return unauthorize
      end
    end

    def unauthorize
      render json: "User unauthorized"
      # head :unauthorized
      # return false
    end
  end
