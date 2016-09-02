class EducationsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  before_action :find_optional_user, only: [:new]
  before_action :authorize, only: [:new, :create]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.visible(:view_educations)
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new(user_id: @user.id)
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(education_params)

    respond_to do |format|
      if @education.save
        format.html { redirect_to edit_education_path(@education), notice: 'Education was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to edit_education_path(@education), notice: 'Education was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(Education.safe_attributes)
    end

  def authorize_edit
    raise Unauthorized unless @education.can?(:edit_educations, :manage_educations)
  end

  def authorize_delete
    raise Unauthorized unless @education.can?(:delete_educations, :manage_educations)
  end
end
