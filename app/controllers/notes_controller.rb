class NotesController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_note, only: [:update]

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to url_back, notice: I18n.t(:notice_successful_create) }
      else
        format.html { render :edit }
      end
    end
  end

 def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to  url_back, notice: I18n.t(:notice_successful_update) }
      else
        format.html { render :edit }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    type = if params[:checklist_note]
             :checklist_note
           elsif params[:survey_note]
             :survey_note
           else
             :note
           end
    params.require(type).permit(Note.safe_attributes)
  end

  def url_back
    if params[:checklist_note]
      checklist_template_path(@note.object)
    elsif params[:survey_note]
      survey_url(@note.object)
    else
      root_path
    end

  end
end
