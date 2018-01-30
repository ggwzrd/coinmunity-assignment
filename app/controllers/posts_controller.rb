class PostsController < ApplicationController
  def index

    @posts = Post.find()
    respond_to do |posts|
      format.json{render :json @posts}

    end
  end
end
