class ProfilesController < BaseController

  def create
    profile = Profile.new(profile_params)

    if user.save
      render json: user.as_json, status: 201
    else
      render json: user.errors.full_messages, status: 422, notice: "Profile not created"
    end
  end

  private

  params.require(:profiles).permit(:nickname, :first_name, :last_name, :picture, :bio)
end
