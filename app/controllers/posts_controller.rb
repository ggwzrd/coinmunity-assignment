class PostsController < BaseController
  skip_before_action :authenticate, only: [:index, :show]
  
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

    temp_params = post_params

    temp_params[:user_id] = @user.id if !@user.nil?
    post = Post.new(temp_params)

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
