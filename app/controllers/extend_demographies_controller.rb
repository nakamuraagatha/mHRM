class ExtendDemographiesController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_extend_demography, only: [:update]

  # POST /extend_demographies
  # POST /extend_demographies.json
  def create
    @extend_demography = ExtendDemography.new(extend_demography_params)

    respond_to do |format|
      if @extend_demography.save
        url_back = @extend_demography.department_id ? departments_path : root_path
        format.html { redirect_to url_back, notice: I18n.t(:notice_successful_create) }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /extend_demographies/1
  # PATCH/PUT /extend_demographies/1.json
  def update
    respond_to do |format|
      if @extend_demography.update(extend_demography_params)
        url_back = @extend_demography.department_id ? departments_path : root_path
        format.html { redirect_to  url_back, notice: I18n.t(:notice_successful_update) }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extend_demography
      @extend_demography = ExtendDemography.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extend_demography_params
      type = params[:department_extend_demography] ? :department_extend_demography : :user_extend_demography
      params.require(type).permit(:user_id, :department_id, :type,
                                  emails_attributes: [:id, :email_type_id, :email_address, :note, :_destroy],
                                  social_media_attributes: [:id, :social_media_type_id, :social_media_handle, :note, :_destroy],
                                  addresses_attributes: [:id, :address_type, :address, :zip_code, :state, :city, :country_code, :state_id, :country_id, :_destroy],
                                  phones_attributes: [:id, :phone_type_id, :phone_number, :note, :_destroy],
                                  faxes_attributes:   [:id, :fax_type_id, :fax_number, :note, :_destroy],
                                  identifications_attributes:   [:id, :identification_number, :status, :date_expired, :issued_by, :note, :identification_type_id, :_destroy]
      )
    end
end
