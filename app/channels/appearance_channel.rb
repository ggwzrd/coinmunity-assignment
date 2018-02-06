class AppearanceChannel < ApplicationCable::Channel

  def subscribed
    # stop_all_streams
    stream_from "AppearanceChannel"
    ActionCable.server.broadcast "AppearanceChannel", { user: current_user.email, user_id: current_user.id, online: :on }
    # stream_from "some_channel"
  end

  def unsubscribed
    ActionCable.server.broadcast "AppearanceChannel", { user: current_user.email, user_id: current_user.id, online: :off }
    # stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

end
