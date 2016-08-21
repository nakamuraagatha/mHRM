class IdentificationsController < ApplicationController
  before_action :set_identification, only: [:show, :edit, :update, :destroy]

  # GET /identifications
  # GET /identifications.json
  def index
    @identifications = Identification.all
  end

  # GET /identifications/1
  # GET /identifications/1.json
  def show
  end

  # GET /identifications/new
  def new
    @identification = Identification.new
  end

  # GET /identifications/1/edit
  def edit
  end

  # POST /identifications
  # POST /identifications.json
  def create
    @identification = Identification.new(identification_params)

    respond_to do |format|
      if @identification.save
        format.html { redirect_to @identification, notice: 'Identification was successfully created.' }
        format.json { render :show, status: :created, location: @identification }
      else
        format.html { render :new }
        format.json { render json: @identification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identifications/1
  # PATCH/PUT /identifications/1.json
  def update
    respond_to do |format|
      if @identification.update(identification_params)
        format.html { redirect_to @identification, notice: 'Identification was successfully updated.' }
        format.json { render :show, status: :ok, location: @identification }
      else
        format.html { render :edit }
        format.json { render json: @identification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identifications/1
  # DELETE /identifications/1.json
  def destroy
    @identification.destroy
    respond_to do |format|
      format.html { redirect_to identifications_url, notice: 'Identification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identification
      @identification = Identification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def identification_params
      params.require(:identification).permit(:identification_number, :status, :date_expired, :issued_by, :note, :identification_type_id)
    end
end
