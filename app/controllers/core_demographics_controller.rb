class CoreDemographicsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_core_demographic, only: [:update]

  # POST /core_demographics
  # POST /core_demographics.json
  def create
    @core_demographic = CoreDemographic.new(core_demographic_params)

    respond_to do |format|
      if @core_demographic.save
        format.html { redirect_to root_path, notice: I18n.t(:notice_successful_create) }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /core_demographics/1
  # PATCH/PUT /core_demographics/1.json
  def update
    respond_to do |format|
      if @core_demographic.update(core_demographic_params)
        format.html { redirect_to root_path, notice: I18n.t(:notice_successful_update) }
      else
        format.html { render 'edit' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_demographic
      @core_demographic = CoreDemographic.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_demographic_params
      params.require(:core_demographic).permit(CoreDemographic.safe_attributes)
    end
end
