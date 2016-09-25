class SurveysController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_survey, only: [:show, :edit, :update, :destroy, :answer, :edit_answer, :delete_answer]
  before_action :find_answer, only: [:edit_answer, :delete_answer]

  before_action :authorize, except: [:index, :show, :answer, :edit_answer, :delete_answer]
  before_action :authorize_answer, only: [:answer, :edit_answer, :delete_answer]

  # GET /surveys
  # GET /surveys.json
  def index
    if User.current.allowed_to?(:manage_roles)
      @surveys = Survey.order('id DESC').paginate(page: params[:page], per_page: 25)
    else
      @surveys = Survey.where(assigned_to_id: User.current.id ).order('id DESC').paginate(page: params[:page], per_page: 25)
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @answers = @survey.survey_answers
  end

  def answer
    @survey.survey_answers<< SurveyAnswer.create(answer_params)
    redirect_to @survey, notice: t(:notice_successful_create)
  end

  def edit_answer
   if request.post?
     @answer.update(answer_params)
     redirect_to @survey, notice: t(:notice_successful_update)
   end
  end

  def delete_answer
    @answer.delete
    redirect_to @survey, notice: t(:notice_successful_delete)
  end

  # GET /surveys/new
  def new
    @survey = Survey.new(user_id: User.current.id)
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_answer
    @answer = SurveyAnswer.find(params[:answer_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def survey_params
    params.require(:survey).permit(Survey.safe_attributes)
  end

  def answer_params
    params.require(:survey_answer).permit(SurveyAnswer.safe_attributes)
  end

  def authorize(ctrl = params[:controller], action = params[:action])
    allowed = User.current.allowed_to?({:controller => ctrl, :action => action})
    allowed ?  true : deny_access
  end


  def authorize_answer
    unless (@survey.assigned_to == User.current) or User.current.allowed_to?( :manage_roles)
      deny_access
    end
  end
end
