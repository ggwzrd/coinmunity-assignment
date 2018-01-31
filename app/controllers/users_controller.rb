class UsersController < BaseController
  # before_action :set_user, only: [:posts]

  def show
    # user = User.find(params[:id])
    user = @user

    respond_to do |format|
      format.json{render status:200, json: user.as_json}
    end
  end

  def posts
    posts = Post.where(user: @user).where(is_spam: false)

    respond_to do |format|
      format.json{render status:200, json: posts.as_json(include: [:reports, trusts: {include: :source}] ) }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
