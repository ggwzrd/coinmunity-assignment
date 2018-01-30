class PostsController < ApplicationController

  def index
    posts = Post.all

    respond_to do |format|
      format.json{render status:200, json: posts.as_json}
    end
  end

  def show
    post = Post.find(params[:id])

    respond_to do |format|
      format.json{render status:200, json: post.as_json}
    end
  end

end
