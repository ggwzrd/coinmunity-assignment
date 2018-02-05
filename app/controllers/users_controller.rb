class UsersController < BaseController
  skip_before_action :authenticate, only: [:posts, :show]
  before_action :set_user, only: [:posts]

  def show
    user = User.find(params[:id])

    respond_to do |format|
      format.json{render status:200, json: user.as_json(
        only: [:id, :trustiness],
        include: :profile
        ) }
    end
  end

  def posts
    posts = Post.where(user: @user).where(is_spam: false).sort_by {|post| post.created_at}.reverse

    respond_to do |format|
      format.json{render status:200, json: posts.as_json(
        except: :content,
        include: [
          { user: { only: [:id, :trustiness], include: { profile: { only: [:id, :nickname, :picture] } } } },
          { tags: { only: :id } },
          { trusts: { only: :id } },
          { reports: { only: :id }, include: { source: { only: :id } } },
          ] ) }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
