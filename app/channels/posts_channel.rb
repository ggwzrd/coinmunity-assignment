class PostsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    posts = Post.all()
    puts "Alllooohhaaaa"
    stream_for posts
    # ActionCable.server.broadcast "posts"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
