class UsersController < ApplicationController
  before_action  :authenticate_user!
  before_action :find_user, except: [:index]
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
    if params[:password] == params[:password_confirmation]
      @user.update(password: params[:password])
      flash[:notice] = t('devise.passwords.updated_not_active')
    else
      flash[:error] = 'Password not matched'
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

  private

  def find_user
    @user = User.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
