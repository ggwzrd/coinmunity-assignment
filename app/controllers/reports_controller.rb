class ReportsController < BaseController

  def create
    report = Report.new(report_params)

    if report.save
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
