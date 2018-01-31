class ReportsController < BaseController

  def create
    temp_params = report_params

    temp_params[:user_id] = @user.id if !@user.nil?

    report = Report.new(temp_params)

    if report.save
      report.post.user.update_truthiness
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
