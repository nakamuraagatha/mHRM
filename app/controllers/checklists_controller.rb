class ChecklistsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_checklist_template, only: [:new_note, :show, :edit, :update, :destroy, :save]

  before_action :require_admin, except: [:index, :show,
                                         :save, :new_assign,
                                         :destroy, :new_note] # ...
  # before_action :authorize, only: [:index, :show, :save]

  def index
    if User.current.admin?
      @checklists = ChecklistTemplate.not_related.order('id DESC').paginate(page: params[:page], per_page: 25)

    else
      @checklists = ChecklistTemplate.not_related.joins(:checklist_users).
          where("#{ChecklistUser.table_name}.assigned_to_id = ? ", User.current.id).order('title DESC').paginate(page: params[:page], per_page: 25)
    end
  end

  def new_note
    @note = ChecklistNote.new(user_id: User.current.id, owner_id: @checklist.id)
  end

  def new_assign
    if request.post?
      @checklist = ChecklistUser.new(params.require(:checklist_user).permit!)

      if @checklist.save
        redirect_to checklist_templates_path
      else
        @checklists = ChecklistTemplate.order('title ASC') - ChecklistTemplate.where(id: ChecklistUser.where(assigned_to_id: User.current.id).pluck(:checklist_template_id))
      end
    else
      @checklists = ChecklistTemplate.order('title ASC') - ChecklistTemplate.where(id: ChecklistUser.where(assigned_to_id: User.current.id).pluck(:checklist_template_id))
      @checklist = ChecklistUser.new(assigned_to_id: User.current.id)

    end
  end

  def show

  end

  def save
    if params[:checklist_answer]
      params[:checklist_answer].each do |key, answer|
        checklist_id = answer[:checklist_id]
        checklist_template_id = answer[:checklist_template_id]
        user_id = answer[:user_id]
        res = ChecklistAnswer.where(user_id: user_id)
                  .where(checklist_id: checklist_id )
                  .where(checklist_template_id: checklist_template_id ).first_or_initialize
        res.update(answer.permit!)
      end
    end

    redirect_to checklist_templates_url, notice: 'Template was successfully updated.'
  end

  def new
    @checklist = ChecklistTemplate.new(user_id: User.current.id,
                                       related_to_id: params[:related_to],
                                       related_to_type: params[:type])
    @checklist.checklists.build
  end

  def edit
  end

  def create
    @checklist = ChecklistTemplate.new(checklist_template_params)

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to checklist_templates_url, notice: 'Template was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @checklist.update(checklist_template_params)
        format.html { redirect_to checklist_templates_url, notice: 'Template was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if User.current.admin?
      @checklist.destroy
    else
      ChecklistUser.where(assigned_to_id: User.current.id, checklist_template_id: @checklist.id).delete_all
      ChecklistAnswer.where(checklist_template_id: @checklist.id, user_id: User.current.id).delete_all
    end

    respond_to do |format|
      format.html { redirect_to checklist_templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_checklist_template
    @checklist = ChecklistTemplate.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def checklist_template_params
    params.require(:checklist_template).permit(ChecklistTemplate.safe_attributes)
  end

  def checklist_template_save_params
    params[:checklist_template][:checklist_answers_attributes] = params[:checklist_template][:checklists_attributes]
    params.require(:checklist_template).permit(ChecklistTemplate.safe_attributes_with_save)
  end

end
