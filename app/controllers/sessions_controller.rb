class SessionsController < Devise::SessionsController

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  clear_respond_to
  respond_to :json

  def create
      super do
        resource.check_daily_sign_in
        render json: { trustiness: resource.trustiness, nickname: resource.profile.nickname, picture: resource.profile.picture } and return
      end
  end

end
