class PostsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # posts = Post.all()
    # puts "Alllooohhaaaa"
    # stop_all_streams
    # posts = Post.where(is_spam: false).sort_by {|post| post.created_at}.reverse
    stream_from "PostsChannel"
    # ActionCable.server.broadcast("PostsChannel", posts)
  end




  def unsubscribed
    puts "disconnected"


      # Any cleanup needed when channel is unsubscribed
    # stop_all_streams




    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
     ActionCable.server.broadcast( "PostsChannel", data)
  end


end
