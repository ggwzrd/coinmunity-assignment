class BroadcastPostJob < ApplicationJob
  ###################
  # Not used for now
  ###################
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast( "PostsChannel", data)
  end
end
