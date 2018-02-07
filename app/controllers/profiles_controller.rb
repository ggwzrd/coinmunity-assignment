class ProfilesController < BaseController

  def create
    temp_params = profile_params
    temp_params[:user_id] = @user.id if !@user.nil?
    @profile = Profile.new(temp_params)
    puts "Saving profilee..."
    if @profile.save
      @profile.user.update_trustiness(@profile.first_name_trustiness) if @profile.first_name
      @profile.user.update_trustiness(@profile.last_name_trustiness) if @profile.last_name
      @profile.user.update_trustiness(@profile.picture_trustiness) if @profile.picture
      @profile.user.update_trustiness(@profile.bio_trustiness) if @profile.bio
      render json: @profile.as_json, status: 201
      puts "Profile saved"
    else
      render json: @profile.errors.full_messages, status: 422, notice: "Profile not created"
    end
  end

  def update
    @profile = Profile.find(params[:id])

    first_name_added = profile_params[:first_name] && !@profile[:first_name]
    last_name_added = profile_params[:last_name] && !@profile[:last_name]
    picture_added = profile_params[:picture] && !@profile[:picture]
    bio_added = profile_params[:bio] && !@profile[:bio]

    temp_params[:first_name] = profile_params[:first_name] ? profile_params[:first_name] : @profile[:first_name]
    temp_params[:last_name] = profile_params[:last_name] ? profile_params[:last_name] : @profile[:last_name]
    temp_params[:picture] = profile_params[:picture] ? profile_params[:picture] : @profile[:picture]
    temp_params[:bio] = profile_params[:bio] ? profile_params[:bio] : @profile[:bio]

    if @profile.update(temp_params)
      @profile.user.update_trustiness(@profile.first_name_trustiness) if first_name_added
      @profile.user.update_trustiness(@profile.last_name_trustiness) if last_name_added
      @profile.user.update_trustiness(@profile.picture_trustiness) if picture_added
      @profile.user.update_trustiness(@profile.bio_trustiness) if bio_added
      render json: @profile.as_json, status: 201
    else
      render json: @profile.errors.full_messages, status: 422, notice: "Profile not updated"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :first_name, :last_name, :picture, :bio, :user_id)
  end
end
