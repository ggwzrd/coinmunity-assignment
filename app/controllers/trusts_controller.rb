class TrustsController < BaseController

  def create
    temp_params = trust_params
    temp_params[:user_id] = @user.id if !@user.nil?
    trust = Trust.new(temp_params)

    return render status: 401, json: {
      success: false,
      message: 'You cannot trust with a trustiness below 0!'
    } if @user.trustiness < 0

    if trust.save
      trust.post.user.update_trustiness
      render notice: "Trust created",json: trust.as_json
    else
      render notice: "Trust not created", json: trust.errors.full_messages
    end
  end

  private

  def trust_params
    params.require(:trust).permit(:source_id, :screenshot, :link, :post_id , :user_id)
  end
end
