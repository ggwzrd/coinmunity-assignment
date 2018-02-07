class RegistrationsController < Devise::RegistrationsController

  clear_respond_to
  respond_to :json

  def create
    super do
      if resource.save
        render json: {
          email: resource.email,
          token: resource.token,
          id: resource.id} and return
        # render json: {user: resource} and return
      end
    end

  end
  private

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end


end
