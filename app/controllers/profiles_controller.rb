class ProfilesController < BaseController
  FIRST_NAME_TRUSTINESS_BONUS = 1
  LAST_NAME_TRUSTINESS_BONUS = 1
  PICTURE_TRUSTINESS_BONUS = 2
  BIO_TRUSTINESS_BONUS = 1

  def create
    temp_params = profiles_params
    temp_params[:user_id] = @user.id if !@user.nil?
    profile = Profile.new(profile_params)

    if profile.save
      @user.update_trustiness(FIRST_NAME_TRUSTINESS_BONUS) if profile.first_name
      @user.update_trustiness(LAST_NAME_TRUSTINESS_BONUS) if profile.last_name
      @user.update_trustiness(PICTURE_TRUSTINESS_BONUS) if profile.picture
      @user.update_trustiness(BIO_TRUSTINESS_BONUS) if profile.bio
      render json: user.as_json, status: 201
    else
      render json: user.errors.full_messages, status: 422, notice: "Profile not created"
    end
  end

  def update
    # Check if first_name, last_name, picture, bio were present before.
    # If they were not present and are now provided, give trustiness points accordingly.
  end

  private

  def profiles
    params.require(:profiles).permit(:nickname, :first_name, :last_name, :picture, :bio)
  end
end
