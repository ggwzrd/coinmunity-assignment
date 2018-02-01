class SessionsController < Devise::RegistrationsController

  def create

    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      user.check_daily_sign_in
      render json: user.as_json(only: [:email, :token]), status: :created
    else
      render json: user.errors.full_messages
      # head(:unauthorized)
    end
  end
end
