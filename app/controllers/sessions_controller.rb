class SessionsController < Devise::RegistrationsController

  respond_to :json

  def create
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :token]), status: :created
    else
      head(:unauthorized)
    end
  end




end
