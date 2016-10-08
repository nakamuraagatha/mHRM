class CasesController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_case, only: [:new_assign_survey, :new_assign, :show, :edit, :update, :destroy, :new_relation, :delete_sub_case_relation]

  before_action :authorize, only: [:new, :create]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]

  # GET /cases
  # GET /cases.json
  def index
    if User.current.can?(:manage_roles)
      @cases = Case.root.order('title desc').paginate(page: params[:page], per_page: 25)
    else
      @cases = Case.root.where(assigned_to_id: User.current.id ).order('title desc').paginate(page: params[:page], per_page: 25)
    end
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    @cases     = @case.sub_cases
    @relations = @case.relations

    @tasks       = @case.tasks
    @surveys     = @case.surveys.map(&:survey)
    @documents   = @case.documents
    @checklists  = @case.checklists.map(&:checklist_template)
    @notes       = @case.case_notes
  end

  # GET /cases/new
  def new
    @case = Case.new(assigned_to_id: User.current.id, subcase_id: params[:subcase_id])
  end

  # GET /cases/1/edit
  def edit
  end

  def new_assign
    if request.post?
      @checklist = ChecklistCase.new(params.require(:checklist_case).permit!)

      if @checklist.save
        redirect_to checklist_templates_path
      else
        @checklists = ChecklistTemplate.order('title ASC') - ChecklistTemplate.where(id: ChecklistCase.where(assigned_to_id: User.current.id).pluck(:checklist_template_id))
      end
    else
      @checklists = ChecklistTemplate.order('title ASC') - ChecklistTemplate.where(id: ChecklistCase.where(assigned_to_id: @case.id).pluck(:checklist_template_id))
      @checklist = ChecklistCase.new(assigned_to_id: @case.id)
    end
  end

  def new_assign_survey
    if request.post?
      @survey = SurveyCase.new(params.require(:survey_case).permit!)
      if @survey.save
        redirect_to case_url(@case)
      else
        @surveys = Survey::Survey.order('name ASC') - Survey::Survey.where(id: SurveyCase.where(assigned_to_id: User.current.id).pluck(:survey_id))
      end
    else
      @surveys = Survey::Survey.order('name ASC') - Survey::Survey.where(id: SurveyCase.where(assigned_to_id: User.current.id).pluck(:survey_id))
      @survey = SurveyCase.new(assigned_to_id: User.current.id)

    end
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)

    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_sub_case_relation
    root_case  = Case.find(@case.subcase_id) rescue nil
    @case.subcase_id = nil
    @case.save
    redirect_to root_case ? root_case : cases_url
  end

  def new_relation
    if request.post?
      @case_relation = CaseRelation.new(params.require(:case_relation).permit!)
      case @case_relation.relation_type
        when 'Survey' then @case_relation.relation_id = params[:survey_id]
        when 'Task' then @case_relation.relation_id = params[:task_id]
        when 'Case' then @case_relation.relation_id = params[:case_id]
        else
      end

      if @case_relation.save
        redirect_to @case.case
      else
        @cases = Case.root.where(assigned_to_id: User.current.id ).pluck(:title, :id)
        @tasks = Task.where(assigned_to_id: User.current.id ).pluck(:title, :id)
        @surveys = Survey::Survey.includes(:survey_users).
            references(:survey_users).where("#{SurveyUser.table_name}.assigned_to_id = ?", User.current.id ).pluck(:name, :id)

      end
    else
      @cases = Case.root.where(assigned_to_id: User.current.id ).pluck(:title, :id)
      @tasks = Task.where(assigned_to_id: User.current.id ).pluck(:title, :id)
      @surveys = Survey::Survey.includes(:survey_users).
          references(:survey_users).where("#{SurveyUser.table_name}.assigned_to_id = ?", User.current.id ).pluck(:name, :id)

      @case_relation = CaseRelation.new(case_id: @case.id, relation_type: 'Case')
    end
  end

  def delete_relation
    a = CaseRelation.find(params[:id])
    a.destroy

    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_case
    @case = Case.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def case_params
    params.require(:case).permit(Case.safe_attributes)
  end

  def authorize_edit
    raise Unauthorized unless @case.can?(:edit_cases, :manage_cases, :manage_roles)
  end

  def authorize_delete
    raise Unauthorized unless @case.can?(:delete_cases, :manage_cases, :manage_roles)
  end

end
