class ProfilesController < BaseController

  def create
    temp_params = profiles_params
    temp_params[:user_id] = @user.id if !@user.nil?
    @profile = Profile.new(profile_params)

    if @profile.save
      @user.update_trustiness(@profile.first_name_trustiness) if @profile.first_name
      @user.update_trustiness(@profile.last_name_trustiness) if @profile.last_name
      @user.update_trustiness(@profile.picture_trustiness) if @profile.picture
      @user.update_trustiness(@profile.bio_trustiness) if @profile.bio
      render json: @profile.as_json, status: 201
    else
      render json: @profile.errors.full_messages, status: 422, notice: "Profile not created"
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
