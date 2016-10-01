class CasesController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_case, only: [:show, :edit, :update, :destroy, :delete_sub_case_relation]

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
    @cases = @case.sub_cases
  end

  # GET /cases/new
  def new
    @case = Case.new(assigned_to_id: User.current.id, subcase_id: params[:subcase_id])
  end

  # GET /cases/1/edit
  def edit
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
    @case.subcase_id = nil
    @case.save
    redirect_to cases_url
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
