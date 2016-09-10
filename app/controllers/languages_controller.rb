class LanguagesController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :create]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]


  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.visible(:view_languages)
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
  end

  # GET /languages/new
  def new
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to @language, notice: 'Language was successfully created.' }
        format.json { render :show, status: :created, location: @language }
      else
        format.html { render :new }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to @language, notice: 'Language was successfully updated.' }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_params
      params.require(:language).permit(Language.safe_attributes)
    end
  def authorize_edit
    raise Unauthorized unless @language.can?(:edit_languages, :manage_languages, :manage_roles)
  end

  def authorize_delete
    raise Unauthorized unless @language.can?(:delete_languages, :manage_languages, :manage_roles)
  end
end
