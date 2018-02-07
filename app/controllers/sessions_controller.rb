class SessionsController < Devise::SessionsController

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  clear_respond_to
  respond_to :json

  def create
      super do
        resource.check_daily_sign_in
        render json: {
          token: resource.token,
          id: resource.id,
          nickname: resource.profile.nickname,
          picture: resource.profile.picture,
          trustiness: resource.trustiness,
          silenced: resource.silenced } and return
        # render json: {resource} and return
      end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password)
  end

end
