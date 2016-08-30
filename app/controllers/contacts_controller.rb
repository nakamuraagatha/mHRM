class ContactsController < ApplicationController
  before_action  :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :find_optional_user, only: [:new]
  before_action :authorize, only: [:new, :create]
  before_action :authorize_edit, only: [:edit, :update]
  before_action :authorize_delete, only: [:destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.visible :view_contacts
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new(user_id: @user.id)
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:emergency_contact, :note, :contact_type_id, :user_id)
    end

  def authorize_edit
    raise Unauthorized unless @contact.can?(:edit_contacts, :manage_contacts)
  end

  def authorize_delete
    raise Unauthorized unless @contact.can?(:delete_contacts, :manage_contacts)
  end
end
