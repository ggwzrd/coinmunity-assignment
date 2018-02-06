class CommentsController < ApplicationController
  def create
    temp_params = comment_params
    temp_params[:user_id] = @user.id if !@user.nil?

    return render status: 401, json: {
      success: false,
      message: 'Your trustiness score is too low to comment!'
    } if @user.silenced

    @comment = Comment.new(temp_params)

    if @comment.save
      render notice: "Comment created",json: @comment.as_json
    else
      render notice: "Comment not created", json: @comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end
