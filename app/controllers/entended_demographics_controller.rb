class EntendedDemographicsController < ApplicationController
  before_action :set_entended_demographic, only: [:show, :edit, :update, :destroy]

  # GET /entended_demographics
  # GET /entended_demographics.json
  def index
    @entended_demographics = EntendedDemographic.all
  end

  # GET /entended_demographics/1
  # GET /entended_demographics/1.json
  def show
  end

  # GET /entended_demographics/new
  def new
    @entended_demographic = EntendedDemographic.new
  end

  # GET /entended_demographics/1/edit
  def edit
  end

  # POST /entended_demographics
  # POST /entended_demographics.json
  def create
    @entended_demographic = EntendedDemographic.new(entended_demographic_params)

    respond_to do |format|
      if @entended_demographic.save
        format.html { redirect_to @entended_demographic, notice: 'Entended demographic was successfully created.' }
        format.json { render :show, status: :created, location: @entended_demographic }
      else
        format.html { render :new }
        format.json { render json: @entended_demographic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entended_demographics/1
  # PATCH/PUT /entended_demographics/1.json
  def update
    respond_to do |format|
      if @entended_demographic.update(entended_demographic_params)
        format.html { redirect_to @entended_demographic, notice: 'Entended demographic was successfully updated.' }
        format.json { render :show, status: :ok, location: @entended_demographic }
      else
        format.html { render :edit }
        format.json { render json: @entended_demographic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entended_demographics/1
  # DELETE /entended_demographics/1.json
  def destroy
    @entended_demographic.destroy
    respond_to do |format|
      format.html { redirect_to entended_demographics_url, notice: 'Entended demographic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entended_demographic
      @entended_demographic = EntendedDemographic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entended_demographic_params
      params.require(:entended_demographic).permit(:identification_id)
    end
end
