class UsersController < ApplicationController
  before_action  :authenticate_user!
  before_action :find_user, except: [:index]

  before_filter :require_admin, only: [:destroy]
  def index
    @users = User.all
  end

  def show
    @profile       = @user.profile
    @educations    = @user.educations
    @documents     = @user.documents
    @organizations = @user.organizations
  end

  def change_password
    if params[:user][:password] == params[:user][:password_confirmation]
      if @user.update(password: params[:user][:password])
        flash[:notice] = I18n.t('devise.passwords.updated_not_active')
      else
        flash[:notice] = I18n.t('error_update')
      end

    else
      flash[:error] = 'Password not matched'
    end
    redirect_to user_path(@user)
  end

  def change_basic_info
    if @user.update(params.require(:user).permit(User.safe_attributes + [:admin]))
      flash[:notice] = I18n.t('notice_successful_update')
    else
      flash[:error] = I18n.t('error_update')
    end
    redirect_to user_path(@user)
  end

  def image_upload
    @user.avatar = params[:images]
    @user.save
    render 'uploader/image_upload'
  end

  def remove_image
    @user.remove_avatar!
    @user.save
    render 'uploader/remove_image'
  end

  def new
  end

  def destroy
    @user.destroy
    flash[:notice] = I18n.t('notice_successful_delete')
    redirect_to :back
  end

  private

  def find_user
    @user = User.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
