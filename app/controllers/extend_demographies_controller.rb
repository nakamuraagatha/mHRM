class ExtendDemographiesController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_extend_demography, only: [:update]

  # POST /extend_demographies
  # POST /extend_demographies.json
  def create
    @extend_demography = ExtendDemography.new(extend_demography_params)

    respond_to do |format|
      if @extend_demography.save
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
    type = if params[:department_extend_demography]
             :department_extend_demography
           elsif params[:user_extend_demography]
             :user_extend_demography
           elsif params[:contact_extend_demography]
             :contact_extend_demography
           else
             :organization_extend_demography
           end
    params.require(type).permit(ExtendDemography.safe_attributes)
  end

  def url_back
    if @extend_demography.department_id
      departments_path
    elsif @extend_demography.contact_id
      contacts_url
    elsif @extend_demography.organization_id
      organizations_path
    elsif User.current != current_user
      employee_path(User.current)
    else
      edit_user_registration_path
    end
  end
end
