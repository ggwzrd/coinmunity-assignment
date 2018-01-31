class TrustsController < BaseController

  def create
    trust = Trust.new(trust_params)

    if trust.save
      render notice: "Trust created",json: trust.as_json
    else
      render notice: "Trust not created", json: trust.errors.full_messages
    end

  end




  def trust_params
    params.require(:trust).permit(:source_id, :screenshot, :link, :post_id , :user_id)
  end

end
