class JournalsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_journal, only: [:show, :edit, :update, :destroy, :answer, :edit_answer, :delete_answer]
  before_action :find_answer, only: [:edit_answer, :delete_answer]

  before_action :authorize, except: [:index, :show, :answer, :edit_answer, :delete_answer]
  before_action :authorize_answer, only: [:answer, :edit_answer, :delete_answer]

  # GET /journals
  # GET /journals.json
  def index
    if User.current.allowed_to?(:manage_roles)
      @journals = Journal.order('id DESC').paginate(page: params[:page], per_page: 25)
    else
      @journals = Journal.where(assigned_to_id: User.current.id ).order('id DESC').paginate(page: params[:page], per_page: 25)
    end
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @answers = @journal.journal_answers
  end

  def answer
    @journal.journal_answers<< JournalAnswer.create(answer_params)
    redirect_to @journal, notice: t(:notice_successful_create)
  end

  def edit_answer
   if request.post?
     @answer.update(answer_params)
     redirect_to @journal, notice: t(:notice_successful_update)
   end
  end

  def delete_answer
    @answer.delete
    redirect_to @journal, notice: t(:notice_successful_delete)
  end

  # GET /journals/new
  def new
    @journal = Journal.new(user_id: User.current.id)
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)

    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to journals_url, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = Journal.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_answer
    @answer = JournalAnswer.find(params[:answer_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def journal_params
    params.require(:journal).permit(Journal.safe_attributes)
  end

  def answer_params
    params.require(:journal_answer).permit(JournalAnswer.safe_attributes)
  end

  def authorize(ctrl = params[:controller], action = params[:action])
    allowed = User.current.allowed_to?({:controller => ctrl, :action => action})
    allowed ?  true : deny_access
  end


  def authorize_answer
    unless (@journal.assigned_to == User.current) or User.current.allowed_to?( :manage_roles)
      deny_access
    end
  end
end
