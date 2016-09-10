class ClearancesController < ApplicationController

  before_action  :authenticate_user!
  before_action :set_clearance, only: [:show, :edit, :update, :destroy]
  # before_action :find_optional_user
  before_action :authorize, only: [:new, :create]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]
  # GET /clearances
  # GET /clearances.json
  def index
    @clearances = Clearance.visible :view_clearances
  end

  # GET /clearances/1
  # GET /clearances/1.json
  def show
  end

  # GET /clearances/new
  def new
    @clearance = Clearance.new(user_id: @user.id)
  end

  # GET /clearances/1/edit
  def edit
  end

  # POST /clearances
  # POST /clearances.json
  def create
    @clearance = Clearance.new(clearance_params)

    respond_to do |format|
      if @clearance.save
        format.html { redirect_to clearances_url, notice: 'Clearance was successfully created.' }

      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /clearances/1
  # PATCH/PUT /clearances/1.json
  def update
    respond_to do |format|
      if @clearance.update(clearance_params)
        format.html { redirect_to clearances_url, notice: 'Clearance was successfully updated.' }

      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /clearances/1
  # DELETE /clearances/1.json
  def destroy
    @clearance.destroy
    respond_to do |format|
      format.html { redirect_to clearances_url, notice: 'Clearance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_clearance
    @clearance = Clearance.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def clearance_params
    params.require(:clearance).permit(Clearance.safe_attributes)
  end

  def authorize_edit
    raise Unauthorized unless @clearance.can?(:edit_clearances, :manage_clearances, :manage_roles)
  end

  def authorize_delete
    raise Unauthorized unless @clearance.can?(:delete_clearances, :manage_clearances, :manage_roles)
  end
end
