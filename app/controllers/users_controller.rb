class UsersController < ApplicationController

  def show
    user = User.find(params[:id])

    respond_to do |format|
      format.json{render status:200, json: user.as_json}
    end
  end
  
end
