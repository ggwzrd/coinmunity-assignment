class PostsController < BaseController

  def index
    posts = Post.where(is_spam: false)

    respond_to do |format|
      format.json{render status:200, json: posts.as_json(include: [:tags, :reports, trusts: {include: :source}] ) }
    end
  end

  def show
    post = Post.find(params[:id])

    respond_to do |format|
      format.json{render status:200, json: post.as_json(include: [:tags, :reports, trusts: {include: :source}] ) }
    end
  end

  def create
    post = Post.new(post_params)

    if post.save
        render notice: "Post created",json: post.as_json
    else
      render notice: "Post not created", json: post.errors.full_messages
    end

  end


  def post_params
    params.require(:post).permit(:content, :link, :images, :user_id, :tags )

  end
end
