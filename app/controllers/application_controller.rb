class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
#   def authenticate_user!
#     authenticate_user_from_token!
#   super
# end
#
#
# def authenticate_user_from_token!
#   User.find_by_token(user_token)
# end
#
# def user_token
#   request.headers['X-AUTH-TOKEN'].presence || params['token'].presence
# end
end
