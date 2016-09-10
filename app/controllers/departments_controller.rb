class DepartmentsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  # before_action :find_optional_user
  before_action :require_admin

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new user_id: @user.id
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_url, notice: 'Department was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to departments_url, notice: 'Department was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    if !@department.in_use?
      @department.destroy
       redirect_to departments_url
      return
    elsif params[:reassign_to_id].present? && (reassign_to = @enumeration.class.find_by_id(params[:reassign_to_id].to_i))
      @department.destroy(reassign_to)
      redirect_to enumerations_path
      return
    end
    @departments = @department.class.where(nil).to_a - [@department]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_department
    @department = Department.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def department_params
    params.require(:department).permit(Department.safe_attributes)
  end

  def authorize_edit
    raise Unauthorized unless @department.can?(:edit_departments, :manage_departments, :manage_roles)
  end

  def authorize_delete
    raise Unauthorized unless @department.can?(:delete_departments, :manage_departments, :manage_roles)
  end
end
