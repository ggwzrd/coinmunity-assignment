class RegistrationsController < Devise::RegistrationsController

  # respond_to :json

  def create

    user = User.new(sign_up_params)

    if user.save
      render json: user.as_json, status: 201
    else
      render json: user.errors.full_messages, status: 422, notice: "User not created"
    end

  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
