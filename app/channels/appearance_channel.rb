class AppearanceChannel < ApplicationCable::Channel
  # before_subscribe :check_user
  # def connect
  #   # user_token = bearer_token
  #   # if user_token
  #   params = request.query_parameters()
  #   # puts params
  #   token = params["token"]
  #   self.current_user = find_verified_user token
  # end

  def check_user
    if !current_user.is_a?(User)
      reject
    end

  end

  def subscribed
    # stop_all_streams
    # puts current_user
    if current_user.is_a?(User)
    # if @userType == "known"
      stream_from "AppearanceChannel"
      ActionCable.server.broadcast "AppearanceChannel", { user: current_user.email, user_id: current_user.id, online: :on }
      # stream_from "some_channel"
    else
      reject
    end
    # end
  end

  def unsubscribed
    if current_user.is_a?(User)

    # if @userType == "known"
      ActionCable.server.broadcast "AppearanceChannel", { user: current_user.email, user_id: current_user.id, online: :off }
    else
      reject
    end
    # stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def find_verified_user token
    # if verified_user = User.find_by_token('17xCzprsnRk5aUF6cHNrqtzK')
    if verified_user = User.find_by(token: token)
      # puts verified_user
      verified_user
    else
      reject_unauthorized_connection
    end
  end


end
