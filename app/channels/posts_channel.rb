class PostsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # posts = Post.all()
    puts "Alllooohhaaaa"
    stop_all_streams
    stream_from "PostsChannel"
    ActionCable.server.broadcast "PostsChannel", { user: current_user.email, online: :on }
    # ActionCable.server.broadcast "posts"
  end

  def unsubscribed
    puts "disconnected"


      # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast "PostsChannel", { user: current_user.email, online: :off }
    stop_all_streams




    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
     ActionCable.server.broadcast( "PostsChannel", data)
  end


end
