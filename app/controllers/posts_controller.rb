class PostsController < ApplicationController

  def index
    posts = Post.where(is_spam: false)

    respond_to do |format|
      format.json{render status:200, json: posts.as_json(include: [:reports, trusts: {include: :source}] ) }
    end
  end

  def show
    post = Post.find(params[:id])

    respond_to do |format|
      format.json{render status:200, json: post.as_json(include: [:reports, trusts: {include: :source}] ) }
    end
  end

end
