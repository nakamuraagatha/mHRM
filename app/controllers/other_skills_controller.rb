class OtherSkillsController < ApplicationController

  before_action  :authenticate_user!
  before_action :set_other_skill, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :create]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]
  
  # GET /other_skills
  # GET /other_skills.json
  def index
    @other_skills = OtherSkill.visible :view_other_skills
  end

  # GET /other_skills/1
  # GET /other_skills/1.json
  def show
  end

  # GET /other_skills/new
  def new
    @other_skill = OtherSkill.new(user_id: @user.id)
  end

  # GET /other_skills/1/edit
  def edit
  end

  # POST /other_skills
  # POST /other_skills.json
  def create
    @other_skill = OtherSkill.new(other_skill_params)

    respond_to do |format|
      if @other_skill.save
        format.html { redirect_to other_skills_url, notice: 'Other skill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /other_skills/1
  # PATCH/PUT /other_skills/1.json
  def update
    respond_to do |format|
      if @other_skill.update(other_skill_params)
        format.html { redirect_to other_skills_url, notice: 'Other skill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /other_skills/1
  # DELETE /other_skills/1.json
  def destroy
    @other_skill.destroy
    respond_to do |format|
      format.html { redirect_to other_skills_url, notice: 'Other skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_skill
      @other_skill = OtherSkill.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_skill_params
      params.require(:other_skill).permit(OtherSkill.safe_attributes)
    end

  def authorize_edit
    raise Unauthorized unless @other_skill.can?(:edit_other_skills, :manage_other_skills, :manage_roles)
  end

  def authorize_delete
    raise Unauthorized unless @other_skill.can?(:delete_other_skills, :manage_other_skills, :manage_roles)
  end
end
