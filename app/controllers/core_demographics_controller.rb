class CoreDemographicsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_core_demographic, only: [:update]

  # POST /core_demographics
  # POST /core_demographics.json
  def create
    @core_demographic = CoreDemographic.new(core_demographic_params)

    respond_to do |format|
      if @core_demographic.save
        format.html { redirect_to :back, notice: 'Profile was successfully Update.' }
        format.json { render :show, status: :created, location: @core_demographic }
      else
        format.html { render :new }
        format.json { render json: @core_demographic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core_demographics/1
  # PATCH/PUT /core_demographics/1.json
  def update
    respond_to do |format|
      if @core_demographic.update(core_demographic_params)
        format.html { redirect_to @core_demographic, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_demographic }
      else
        format.html { render :edit }
        format.json { render json: @core_demographic.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_demographic
      @core_demographic = CoreDemographic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_demographic_params
      params.require(:core_demographic).permit(:user_id, :first_name, :last_name, :middle_name, :gender_id, :birth_date, :religion_id, :title, :note, :ethnicity_id)
    end
end
