class SurveysController < ApplicationController

  before_filter :load_survey, :only => [:show, :edit, :update]

  def index
    if User.current.allowed_to?(:manage_roles)
      @surveys = Survey::Survey.order('id DESC').paginate(page: params[:page], per_page: 25)
    else
      @surveys = Survey::Survey.where(assigned_to_id: User.current.id ).order('id DESC').paginate(page: params[:page], per_page: 25)
    end

  end

  def new
    @survey = Survey::Survey.new
  end

  def create
    @survey = Survey::Survey.new(survey_params)
    if @survey.valid? && @survey.save
      default_redirect
    else
      render :action => :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @survey.update_attributes(survey_params)
      default_redirect
    else
      render :action => :edit
    end
  end

  private

  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
    rails4? or rails5? ? params_whitelist : params[:survey_survey]
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end

end