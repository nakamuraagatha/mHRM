
class EnumerationsController < ApplicationController
  before_action  :authenticate_user!

  before_filter :require_admin
  before_filter :build_new_enumeration, :only => [:new, :create]
  before_filter :find_enumeration, :only => [:edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html{}
    end
  end

  def new
  end

  def create
    if request.post? && @enumeration.save
      flash[:notice] = I18n.t(:notice_successful_create)
      redirect_to enumerations_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @enumeration.update_attributes(params.require(:enumeration).permit!)
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t "notice_successful_update"
          redirect_to enumerations_path
        }
        format.js { render :nothing => true }
      end
    else
      respond_to do |format|
        format.html { render :action => 'edit' }
        format.js { render :nothing => true, :status => 422 }
      end
    end
  end

  def destroy
    if !@enumeration.in_use?
      # No associated objects
      @enumeration.destroy
      redirect_to enumerations_path
      return
    elsif params[:reassign_to_id].present? && (reassign_to = @enumeration.class.find_by_id(params[:reassign_to_id].to_i))
      @enumeration.destroy(reassign_to)
      redirect_to enumerations_path
      return
    end
    @enumerations = @enumeration.class.where(nil).to_a - [@enumeration]
  end

  private

  def build_new_enumeration
    class_name = params[:enumeration] && params[:enumeration][:type] || params[:type]

    @enumeration = Enumeration.new_subclass_instance(class_name, params[:action]=='new' ? params[:enumeration] : params.require(:enumeration).permit!)
    if @enumeration.nil?
      render_404
    end
  end

  def find_enumeration
    @enumeration = Enumeration.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end

