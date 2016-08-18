class CoreDemographicsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_core_demographic, only: [:show, :edit, :update, :destroy]

  # GET /core_demographics
  # GET /core_demographics.json
  def index
    @core_demographics = CoreDemographic.all
  end

  def image_upload
    current_user.avatar = params[:images]
    current_user.save
    render 'uploader/image_upload'
  end

  def remove_image
    current_user.remove_avatar!
    current_user.save
    render 'uploader/remove_image'
  end

  # GET /core_demographics/1
  # GET /core_demographics/1.json
  def show
  end

  # GET /core_demographics/new
  def new
    @core_demographic = CoreDemographic.new
  end

  # GET /core_demographics/1/edit
  def edit
  end

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

  # DELETE /core_demographics/1
  # DELETE /core_demographics/1.json
  def destroy
    @core_demographic.destroy
    respond_to do |format|
      format.html { redirect_to core_demographics_url, notice: 'Core demographic was successfully destroyed.' }
      format.json { head :no_content }
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
