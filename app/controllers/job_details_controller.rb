class JobDetailsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_job_detail, only: [:update]


  def create
    @job_detail = JobDetail.new(job_detail_params)

    respond_to do |format|
      if @job_detail.save
        format.html { redirect_to root_path , notice: I18n.t(:notice_successful_create) }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /job_details/1
  # PATCH/PUT /job_details/1.json
  def update
    respond_to do |format|
      if @job_detail.update(job_detail_params)
        format.html { redirect_to root_path, notice: I18n.t(:notice_successful_update) }
      else
        format.html { render :edit }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_job_detail
    @job_detail = JobDetail.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_detail_params
    params.require(:job_detail).permit(:user_id, :department_id, :note, :role_id)
  end
end
