class TasksController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :new_note, :add_note, :delete_sub_task_relation]
  # before_action :find_optional_user
  before_action :authorize, only: [:new, :create, :add_note, :new_note]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.not_related.root.where(assigned_to: @user).or(Task.root.where(for_individual: @user) )
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @notes = @task.task_notes
     @tasks = @task.sub_tasks
  end

  # GET /tasks/new
  def new
    @task = Task.new(user_id: @user.id,
                     assigned_to_id: @user.id,
                     sub_task_id: params[:sub_task_id],
                     related_to_id: params[:related_to],
                     related_to_type: params[:type])
  end

  def add_note
    @note = TaskNote.new(user_id: @user.id)
  end

  def new_note
    @note = TaskNote.new(params.require(:task_note).permit(TaskNote.safe_attributes))
    @note.task_id = @task.id
    respond_to do |format|
      if @note.save
        format.html { redirect_to @task, notice: 'Task Note was successfully created.' }
       else
        format.html { render :edit }
       end
    end
  end

  # GET /tasks/1/edit
  def edit
    @note = TaskNote.new(user_id: @user.id)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @note = TaskNote.new(user_id: @user.id)

    respond_to do |format|
      if @task.save
        format.html { redirect_to back_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to back_url, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_sub_task_relation
    @task.sub_task_id = nil
    @task.save
    redirect_to tasks_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(Task.safe_attributes)
  end

  def authorize_edit
    raise Unauthorized unless @task.can?(:edit_tasks, :manage_tasks, :manage_roles)
  end

  def authorize_delete
    raise Unauthorized unless @task.can?(:delete_tasks, :manage_tasks, :manage_roles)
  end

  def back_url
    if @task.case
      case_url(@task.case)
    else
      tasks_url
    end
  end

end
