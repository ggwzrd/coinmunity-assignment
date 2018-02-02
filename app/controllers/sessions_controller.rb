class SessionsController < Devise::SessionsController

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  clear_respond_to
  respond_to :json

  def create
      super do
        render json:  {email: resource.email, token: resource.token} and return
      end
  end

end
