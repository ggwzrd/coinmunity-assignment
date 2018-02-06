class ReportsController < BaseController

  def create
    temp_params = report_params
    temp_params[:user_id] = @user.id if !@user.nil?

    return render status: 401, json: {
      success: false,
      message: 'You cannot report with a trustiness below 0!'
    } if @user.trustiness < 0

    return render status: 401, json: {
      success: false,
      message: 'You cannot report your own posts!'
    } if @user == Post.find(report_params[:post_id]).user

    @report = Report.new(temp_params)

    if @report.save
      @report.post.user.update_trustiness(@report.report_trustiness)
      render notice: "Report created",json: @report.as_json
    else
      render notice: "Report not created", json: @report.errors.full_messages
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason, :screenshot, :link, :post_id, :user_id)
  end
end
