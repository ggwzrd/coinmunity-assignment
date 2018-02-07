class RegistrationsController < Devise::RegistrationsController

  clear_respond_to
  respond_to :json

  def create
    super do
      # new_user = User.new()
      # if resource.save
      # user = User.new(email: resource.email, password: resource.password)
        # render json: {
        #   email: resource.email,
        #   token: resource.token} and return
        render json: {user: resource} and return
      end
    end

  end



end
