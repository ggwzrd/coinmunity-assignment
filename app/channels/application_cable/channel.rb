module ApplicationCable
  class Channel < ActionCable::Channel::Base
    # identified_by :current_user


    # def bearer_token
    #   pattern = /^Bearer /
    #   header  = request.headers['Authorization']
    #   header.gsub(pattern, '') if header && header.match(pattern)
    # end
  end
end
