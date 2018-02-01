class ReportsController < BaseController

  def create
    temp_params = report_params
    temp_params[:user_id] = @user.id if !@user.nil?
    report = Report.new(temp_params)

    return render status: 401, json: {
      success: false,
      message: 'You cannot report with a trustiness below 0!'
    } if @user.trustiness < 0

    if report.save
      report.post.user.update_trustiness
      render notice: "Report created",json: report.as_json
    else
      render notice: "Report not created", json: report.errors.full_messages
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason, :screenshot, :link, :post_id, :user_id)
  end
end
